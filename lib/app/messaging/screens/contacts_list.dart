import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              CupertinoIcons.chevron_back,
              color: Color.fromARGB(255, 100, 105, 255),
            ),
          ),
          title: const Text(
            "Friends",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'Capriola',
                color: Colors.black,
                fontSize: 24),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CupertinoButton.filled(
                  child: const Text(
                    "Return to previous screen",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Capriola',
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ));
  }
}