import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isCurrentUser;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            if (isCurrentUser) const Spacer(),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: isCurrentUser
                        ? const Color.fromARGB(255, 100, 105, 255)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isCurrentUser ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
            if (!isCurrentUser) const Spacer(),
          ],
        );
      }),
    );
  }
}
