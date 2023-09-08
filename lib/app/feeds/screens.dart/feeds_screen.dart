import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:iconsax/iconsax.dart';
import 'package:teens_next/app/feeds/components/post_card.dart';
import 'package:teens_next/app/feeds/screens.dart/new_comment.dart';
import 'package:teens_next/app/feeds/screens.dart/new_post.dart';
import 'package:teens_next/app/screens/screens.dart';
import 'package:teens_next/services/posting_service.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final PostingService _postingService = PostingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/imgs/tn_logo.svg',
            fit: BoxFit.contain,
            width: 90,
            height: 90,
          ),
        ]),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                          builder: (context) => const FriendsScreen()));
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

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          PostCard(
              title: data['title'],
              sender: data['name'],
              body: data['message'],
              iconButtons: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, CupertinoPageRoute(builder: (context) => const NewComment()));
                  },
                  padding: const EdgeInsets.only(right: 84),
                  icon: const Icon(Iconsax.messages_2),
                ),
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.only(right: 84),
                  icon: const Icon(Iconsax.like_1),
                ),
                IconButton(
                  onPressed: () {},
                  // need to change this icon to something more meaningful
                  icon: const Icon(Iconsax.activity),
                )
              ])
        ],
      ),
    );
  }

  Widget _buildPostList() {
    return StreamBuilder(
      stream: _postingService.getPosts(),
      builder: (context, snapshot) {
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
          return const Text(
            "Loading",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 16,
            ),
          );
        }

        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildPostItem(document))
              .toList(),
        );
      },
    );
  }
}
