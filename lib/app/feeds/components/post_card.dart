import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String postMessage;

  const PostCard({
    super.key,
    required this.postMessage
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
      child: SizedBox(
        width: 500,
        height: 250,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(
            child: Text(
              postMessage,
              style: const TextStyle(
                color: Colors.black, fontFamily: 'Capriola', fontSize: 18),
            ),
          ),
          
        ),
      ),
    );
  }
}
