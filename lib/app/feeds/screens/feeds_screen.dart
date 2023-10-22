import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:teens_next/app/feeds/feeds.dart';
import 'package:teens_next/app/feeds/screens/user_settings.dart';
import 'package:teens_next/app/messaging/screens/contacts_list.dart';
import 'package:teens_next/app/screens/user_profile.dart';
import 'package:teens_next/components/profile_gradient.dart';
import 'package:teens_next/services/services.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final PostingService _postingService = PostingService();
  final TextEditingController searchController = TextEditingController();

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  void toggleLike() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200]?.withOpacity(0.5),
      appBar: AppBar(
        elevation: 1,
        leading: MenuAnchor(
          alignmentOffset: const Offset(14, 0),
          menuChildren: [
            Row(
              children: [
                MenuItemButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile()));
                  },
                  leadingIcon: const Icon(Iconsax.profile_circle5),
                  child: const Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Capriola',
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                MenuItemButton(
                  onPressed: () {
                    signOut();
                  },
                  leadingIcon: const Icon(Iconsax.logout_14),
                  child: const Center(
                    child: Text(
                      "Log out",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Capriola',
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            /*
            Row(
              children: [
                MenuItemButton(
                  onPressed: () {
                    signOut();
                  },
                  leadingIcon: const Icon(
                    Iconsax.logout_14,
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Capriola',
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
            */
          ],
          builder: (context, controller, child) {
            return GestureDetector(
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: const Row(
                children: [
                  SizedBox(width: 16),
                  ProfileGradient(width: 40, height: 40),
                ],
              ),
            );
          },
        ),
        title: const Text(
          "Feeds",
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Capriola',
              color: Colors.black,
              fontSize: 24),
        ),
        actions: [
          /*
          CircleTile(
            icon: const Icon(
              Iconsax.search_normal,
              color: Colors.black,
              weight: 60,
            ),
            onTap: () {
              ExpandableSearchBar(
                  onTap: () => print(searchController.text.toString()),
                  hintText: "Search something",
                  editTextController: searchController);
            },
          )
          */
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserSettings()));
              },
              icon: const Icon(Iconsax.setting_2),
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            /*
            Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "Logged in as: ${currentUser.displayName}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Capriola',
                      fontSize: 12),
                ),
              ),
            ),
            */
            Expanded(child: _buildPostList()),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 6, bottom: 66),
        child: SpeedDial(
          icon: Iconsax.edit,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(24)),
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 255, 247, 100),
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

        Map<String, dynamic> userData =
            userSnapshot.data!.data() as Map<String, dynamic>;
        Color userColorOne = Color(userData['user_color_one']);
        Color userColorTwo = Color(userData['user_color_two']);

        // Build the post-related elements
        Widget postContent = Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              PostCard(
                title: data['title'],
                sender: data['name'],
                body: data['message'],
                userColors: [userColorOne, userColorTwo],
                iconButtons: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const NewComment(),
                        ),
                      );
                    },
                    padding: const EdgeInsets.only(right: 84),
                    icon: const Icon(Iconsax.messages_2),
                  ),
                  IconButton(
                    onPressed: () {
                      toggleLike();
                    },
                    padding: const EdgeInsets.only(right: 84),
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
                  IconButton(
                    onPressed: () {},
                    // need to change this icon to something more meaningful
                    icon: const Icon(Iconsax.activity),
                  )
                ],
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
          return const Text(
            "No posts available",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 16,
            ),
          );
        }
      },
    );
  }
}
