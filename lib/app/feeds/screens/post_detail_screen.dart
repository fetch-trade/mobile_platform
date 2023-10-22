import 'package:expandable_search_bar/expandable_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:teens_next/app/authentication/components/components.dart';
import 'package:teens_next/app/screens/user_profile.dart';
import 'package:teens_next/components/profile_gradient.dart';
import 'package:teens_next/services/auth_service.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController searchController = TextEditingController();

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 1,
        leading: MenuAnchor(
          alignmentOffset: const Offset(14, 0),
          menuChildren: [
            Row(
              children: [
                MenuItemButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile()));
                  },
                  leadingIcon: const Icon(Iconsax.profile_2user),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8, right: 20),
                    child: Text(
                      "User profile",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Capriola',
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                MenuItemButton(
                  onPressed: () {
                    signOut();
                  },
                  leadingIcon: const Icon(Iconsax.logout_14),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8, right: 20),
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Capriola',
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ],
          builder: (context, controller, child) {
            return GestureDetector(
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: const Row(
                children: [
                  SizedBox(width: 16),
                  ProfileGradient(width: 40, height: 40),
                ],
              ),
            );
          },
        ),
        title: const Text(
          "Post details",
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
      ),
    );
  }
}
