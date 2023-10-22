import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/components/input_field.dart';

class NewComment extends StatefulWidget {
  const NewComment({super.key});

  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  final TextEditingController _commentController = TextEditingController();

  // final _firebaseFirestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser!;

  /*
  void addComment(String comment) {
    _firebaseFirestore
        .collection('user_posts')
        .doc(widget.postId)
        .collection('comments')
        .add({
      'comment_text': comment,
      'commenter': currentUser,
      'time_created': Timestamp.now()
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            largeTitle: Text(
              "New Comment",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'REM', fontSize: 24),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Material(
                  child: InputField(
                    controller: _commentController,
                    width: 600,
                    height: 250,
                    maxLines: 11,
                    maxLength: 300,
                    autocorrect: true,
                    obscureText: false,
                    align: TextAlign.left, // check this value
                    padding:
                        const EdgeInsets.only(top: 12, left: 12, right: 12),
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Capriola',
                        fontSize: 18),
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
                          color: Colors.grey[400],
                          fontFamily: 'REM',
                          fontSize: 18),
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
          )
        ],
      ),
    );
  }
}
