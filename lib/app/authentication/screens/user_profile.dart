import 'package:expandable_search_bar/expandable_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:teens_next/app/authentication/components/circle_tile.dart';
import 'package:teens_next/app/authentication/components/larger_profile_gradient.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const LargerProfileGradient(),
          title: const Text(
            "User profile",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'Capriola',
                color: Colors.black,
                fontSize: 24),
          ),
          actions: [
            CircleTile(
              icon: const Icon(
                Iconsax.search_normal,
                color: Colors.black,
                weight: 60,
              ),
              onTap: () {
                ExpandableSearchBar(
                    onTap: () => print(searchController.text.toString()),
                    hintText: "Search something",
                    editTextController: searchController);
              },
            )
          ],
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
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
