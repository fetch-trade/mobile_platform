import 'package:flutter/material.dart';
import 'package:fetch/app/feeds/components/alt_user_gradient.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String sender;
  final String? body;
  final List<Color> userColors;
  final List<Widget> iconButtons;

  const PostCard(
      {super.key,
      required this.title,
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
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AltUserGradient(
                        userColors: userColors,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(right: 8, top: 8),
                            child: Text(
                              title,
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
                  padding: const EdgeInsets.only(left: 28),
                  margin: const EdgeInsets.all(16),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: iconButtons
              ),
            ],
          ),
        ],
      ),
    );
  }
}