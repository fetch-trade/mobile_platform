import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:fetch/app/feeds/feeds.dart';
// import 'package:fetch/app/feeds/screens/user_settings.dart';
import 'package:fetch/app/messaging/screens/contacts_list.dart';
// import 'package:fetch/app/screens/user_profile.dart';
// import 'package:fetch/components/profile_gradient.dart';
import 'package:fetch/services/services.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final PostingService _postingService = PostingService();
  final TextEditingController searchController = TextEditingController();

  Future<void> signOut() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    await authService.signOut();
  }

  void toggleLike() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200]?.withOpacity(0.5),
      appBar: AppBar(
        toolbarHeight: 48,
        elevation: 0,
        scrolledUnderElevation: 0.4,
        title: SvgPicture.asset(
            'assets/imgs/fetch_logo.svg',
            height: 60,
            width: 60,
        ),
                backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Expanded(child: _buildPostList()),
                StreamBuilder(
                  stream: _postingService.getPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: const Color.fromARGB(255, 100, 105, 255),
                          size: 100,
                        ),
                      );
                    } else {
                      return const SizedBox.shrink(); // Empty container when not loading
                    }
                  },
                ),
              ],
            ),
          )
        ]
      ), 
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 64),
        child: SpeedDial(
          icon: LucideIcons.plus,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(24)),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(245, 218, 44, 93),
          overlayColor: Colors.white,
          overlayOpacity: 0.2,
          children: [
            SpeedDialChild(
                child: const Icon(Iconsax.message),
                label: "New Message",
                labelStyle: const TextStyle(
                    color: Colors.white, fontFamily: 'Capriola', fontSize: 12),
                foregroundColor: const Color.fromARGB(255, 100, 105, 255),
                labelBackgroundColor: const Color.fromARGB(255, 100, 105, 255),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ContactsList()));
                }),
            SpeedDialChild(
              child: const Icon(Iconsax.note),
              label: "New Post",
              labelStyle: const TextStyle(
                  color: Colors.white, fontFamily: 'Capriola', fontSize: 12),
              foregroundColor: const Color.fromARGB(255, 100, 105, 255),
              labelBackgroundColor: const Color.fromARGB(255, 100, 105, 255),
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const NewPost()));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    String userId = data['senderUid'];
    // int likeCounter = 0;

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(userId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
        if (userSnapshot.hasError) {
          return Text(
            "Error${userSnapshot.error}",
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 24,
            ),
          );
        }

        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: const Color.fromARGB(255, 100, 105, 255), size: 100));
        }

        if (!userSnapshot.hasData || userSnapshot.data == null) {
          return const Text(
            "No data found.",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 18,
            ),
          );
        }

        Map<String, dynamic> userData =
            userSnapshot.data!.data() as Map<String, dynamic>;

        Color userColorOne = Color(userData['user_color_one']);
        Color userColorTwo = Color(userData['user_color_two']);

        // Build the post-related elements
        Widget postContent = Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              GestureDetector(
                child: PostCard(
                  title: data['title'],
                  sender: "@${data['name']}",
                  body: data['message'],
                  userColors: [userColorOne, userColorTwo],
                  iconButtons: [
                    Padding(
                      padding: const EdgeInsets.only(left: 36, right: 76, bottom: 16),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  NewComment(postId: document.id),
                            ),
                          );
                        },
                        icon: const Icon(Iconsax.messages_2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 76, bottom: 16),
                      child: IconButton(
                        onPressed: () {
                          toggleLike();
                        },
                        icon: const Row(children: [
                          Icon(Iconsax.like_1),
                          // SizedBox(width: 8),
                          /*
                          Text(
                            likeCounter.toString(),
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Capriola',
                              color: Colors.black,
                              fontSize: 14
                            ),
                          )
                          */
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: IconButton(
                        onPressed: () {},
                        // need to change this icon to something more meaningful
                        icon: const Icon(Iconsax.bookmark),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => PostDetailScreen(postId: document.id)));
                },
              ),
            ],
          ),
        );

        return postContent;
      },
    );
  }

  Widget _buildPostList() {
    return StreamBuilder(
      stream: _postingService.getPosts(),
      builder: (context, snapshot) {
        // print("Snapshot data: ${snapshot.data}");
        if (snapshot.hasError) {
          return Text(
            "Error${snapshot.error}",
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 24,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: const Color.fromARGB(255, 100, 105, 255), size: 100));
        }

        // Check if the snapshot data is not null and contains documents
        if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildPostItem(document))
                .toList(),
          );
        } else {
          // Handle the case where there are no posts
          return const Center(child: 
            Text(
              "No posts available",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Capriola',
                fontSize: 16,
              ),
            ),
          );
        }
      },
    );
  }
}
