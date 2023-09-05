import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/app/feeds/components/post_input_field.dart';
import 'package:teens_next/services/posting_service.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _postController = TextEditingController();
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
                  child: PostInputField(
                      controller: _postController,
                      hintText: "What's there to do?",
                      hintTextStyle: TextStyle(
                          color: Colors.grey[400],
                          fontFamily: 'Capriola',
                          fontSize: 18),
                      obscureText: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 600,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 100, 105, 255),
                        onPressed: () {
                          _postingService.sendPost(_postController.text);
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
