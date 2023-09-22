import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/app/feeds/screens/post_detail_screen.dart';
import 'package:teens_next/components/profile_gradient.dart';

class PostCard extends StatefulWidget {
  final String title;
  final String sender;
  final String body;
  final List<IconButton> iconButtons;

  const PostCard(
      {super.key,
      required this.title,
      required this.sender,
      required this.body,
      required this.iconButtons});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const PostDetailScreen()));
          
        },
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const ProfileGradient(),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(right: 8, top: 8),
                              child: Text(
                                widget.title,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'REM',
                                    fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.sender,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Capriola',
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.only(left: 42),
                    margin: const EdgeInsets.all(12),
                    child: Text(
                      widget.body,
                      softWrap: true,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Capriola',
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 64, top: 16, bottom: 16),
                  child: Row(children: widget.iconButtons),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
