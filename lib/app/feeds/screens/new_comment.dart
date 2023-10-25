import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/components/input_field.dart';

class NewComment extends StatefulWidget {
  final String postId;

  const NewComment({super.key, required this.postId});

  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  final TextEditingController _commentController = TextEditingController();

  final _firebaseFirestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser!;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  fetchUserColorOne() async {
    DocumentSnapshot userSnapshot =
        await _firebaseFirestore.collection('users').doc(currentUserId).get();

    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      int userColorOne = Color(userData['user_color_one']).value;
      return userColorOne;
    } else {
      // Handle the case when the user document doesn't exist
      // Return a default set of colors or handle the error accordingly
      return 0; // Default colors
    }
  }

  fetchUserColorTwo() async {
    DocumentSnapshot userSnapshot =
        await _firebaseFirestore.collection('users').doc(currentUserId).get();

    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
        int userColorTwo = Color(userData['user_color_two']).value;
      return userColorTwo;
    } else {
      // Handle the case when the user document doesn't exist
      // Return a default set of colors or handle the error accordingly
      return 1; // Default colors
    }
  }

  void addComment(String comment) {
    _firebaseFirestore
        .collection('user_posts')
        .doc(widget.postId)
        .collection('comments')
        .add({
      'comment_text': comment,
      'commenter': currentUser.displayName,
      'commenter_uid': currentUserId,
      'time_created': Timestamp.now()
    });
  }

  void saveDraft(String draftText) {
    _firebaseFirestore
        .collection('users')
        .doc(currentUser.uid)
        .collection('saved_drafts')
        .add({'draft_text': draftText, 'time_created': Timestamp.now()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.chevron_back,
            color: Color.fromARGB(255, 100, 105, 255),
          ),
        ),
        middle: const Text(
          "New Comment",
          style: TextStyle(
              color: Colors.black, fontFamily: 'Capriola', fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              child: InputField(
                controller: _commentController,
                width: 600,
                height: 250,
                maxLines: 11,
                maxLength: 200,
                autocorrect: true,
                obscureText: false,
                align: TextAlign.left, // check this value
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                textStyle: const TextStyle(
                    color: Colors.black, fontFamily: 'REM', fontSize: 18),
                inputDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: "What are your thoughts on this post?",
                  hintStyle: TextStyle(
                      color: Colors.grey[400], fontFamily: 'REM', fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 600,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 100, 105, 255),
                    onPressed: () {
                      addComment(_commentController.text);
                      _commentController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Comment",
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Capriola',
                          fontSize: 18),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 600,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 255, 247, 100),
                    onPressed: () {
                      saveDraft(_commentController.text);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save as draft",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Capriola',
                          fontSize: 18),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
