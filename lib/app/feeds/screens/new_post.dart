import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/components/input_field.dart';
import 'package:teens_next/services/posting_service.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _postController = TextEditingController();
  final _postTitleController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;
  final PostingService _postingService = PostingService();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            largeTitle: Text(
              "New Post",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Capriola', fontSize: 24),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Material(
                  child: InputField(
                    controller: _postTitleController,
                    width: 600,
                    height: 80,
                    maxLines: 1,
                    maxLength: 35,
                    autocorrect: true,
                    obscureText: false,
                    align: TextAlign.left, // check this value
                    padding:
                        const EdgeInsets.only(top: 12, left: 12, right: 12),
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
                      hintText: "Give this post a name",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontFamily: 'REM',
                          fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Material(
                  child: InputField(
                      controller: _postController,
                      width: 600,
                      height: 300,
                      maxLines: 11,
                      maxLength: 300,
                      autocorrect: true,
                      obscureText: false,
                      align: TextAlign.left,  // check this value
                      padding: const EdgeInsets.only(top: 12, left: 12, right: 12), 
                      textStyle: const TextStyle(
                        color: Colors.black, fontFamily: 'Capriola', fontSize: 18),
                      inputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "What's there to do?",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontFamily: 'REM',
                          fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 600,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 100, 105, 255),
                        onPressed: () {
                          _postingService.sendPost(
                              _postTitleController.text, _postController.text);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Post",
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