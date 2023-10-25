import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:teens_next/app/authentication/resources/get_gradient_colors.dart';
import 'package:teens_next/app/feeds/feeds.dart';

class PostDetailScreen extends StatelessWidget {
  final String? postId;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  PostDetailScreen({super.key, required this.postId});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.chevron_back,
            color: Color.fromARGB(255, 100, 105, 255),
          ),
        ),
        title: const Text(
          "Comments",
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Capriola',
              color: Colors.black,
              fontSize: 24),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [Expanded(child: _buildCommentList())]),
    );
  }

  /*
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
              GestureDetector(
                child: PostCard(
                  title: data['title'],
                  sender: "@${data['name']}",
                  body: data['message'],
                  userColors: [userColorOne, userColorTwo],
                  iconButtons: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                NewComment(postId: document.id),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only(right: 84),
                      icon: const Icon(Iconsax.messages_2),
                    ),
                    IconButton(
                      onPressed: () {
                        // toggleLike();
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
                      icon: const Icon(Iconsax.bookmark),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              PostDetailScreen(postId: document.id)));
                },
              ),
            ],
          ),
        );

        return postContent;
      },
    );
  }
  */

  Widget _buildCommentList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore
          .collection('user_posts')
          .doc(postId)
          .collection('comments')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: const Color.fromARGB(255, 100, 105, 255), size: 100));
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "No comments available.",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Capriola',
                fontSize: 18,
              ),
            ),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

            // Color commenterColorOne = Color(data['commenter_color_one']);
            // Color commenterColorTwo = Color(data['commenter_color_two']);

            return CommentCard(
              sender: "@${data['commenter']}",
              body: data['comment_text'].toString(),
              userColors: [/* commenterColorOne, commenterColorTwo */],
              iconButtons: [
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.only(right: 84),
                  icon: const Icon(Iconsax.messages_2),
                ),
                IconButton(
                  onPressed: () {
                    // toggleLike();
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
                  icon: const Icon(Iconsax.bookmark),
                )
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
