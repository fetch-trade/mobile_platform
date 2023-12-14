import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:fetch/components/profile_gradient.dart';
import 'package:fetch/services/auth_service.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController searchController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        /*
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.chevron_back,
            color: Color.fromARGB(245, 218, 44, 93),
          ),
        ),
        */
        title: const Text(
          "Profile",
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 24),
        ),
        actions: [
          /*
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
            */
          IconButton(
            onPressed: signOut, 
            icon: const Icon(LucideIcons.logOut),
            color: Colors.black,  
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: ProfileGradient(width: 140, height: 140),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "@${currentUser?.displayName}",
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'Capriola',
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: DefaultTabController(
                  initialIndex: 0,
                  length: 3,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      elevation: 0,
                      toolbarHeight: 4,
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      bottom: const TabBar(
                          indicatorColor: Color.fromARGB(255, 218, 44, 90),
                          tabs: <Widget>[
                            Tab(
                              icon: Icon(
                                LucideIcons.clipboardList,
                                color: Colors.black,
                              ),
                            ),
                            Tab(
                              icon: Icon(
                                LucideIcons.circleDashed,
                                color: Colors.black,
                              ),
                            ),
                            Tab(
                              icon: Icon(
                                LucideIcons.import,
                                color: Colors.black
                              ),
                            )
                          ]),
                    ),
                    body: const TabBarView(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Listings",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Drafts",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Saved",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
