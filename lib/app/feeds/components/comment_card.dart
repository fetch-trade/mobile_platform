import 'package:flutter/material.dart';
import 'package:teens_next/app/feeds/components/alt_user_gradient.dart';

class CommentCard extends StatelessWidget {
  final String sender;
  final String? body;
  final List<Color> userColors;
  final List<IconButton> iconButtons;

  const CommentCard(
      {super.key,
      required this.sender,
      required this.body,
      required this.iconButtons,
      required this.userColors});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                    AltUserGradient(
                      userColors: userColors,
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              sender,
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
                  padding: const EdgeInsets.only(left: 38),
                  margin: const EdgeInsets.all(12),
                  child: Text(
                    body!,
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
                child: Row(children: iconButtons),
              ),
            ],
          ),
        ],
      ),
    );
  }
}