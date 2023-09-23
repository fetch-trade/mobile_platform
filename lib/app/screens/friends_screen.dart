import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:teens_next/app/authentication/components/components.dart';
import 'package:teens_next/app/authentication/screens/user_profile.dart';
import 'package:teens_next/services/auth_service.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final TextEditingController searchController = TextEditingController();

  final String apiKey = "hkhhV4H2q4UKTCrrF5Hygk4HDmckVq6q";
  final mapLocation = const LatLng(29.7388, -95.758003);
  double zoom = 0;

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
              child: const LargerProfileGradient(),
            );
          },
        ),
        title: Text(
          "Friends",
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Capriola',
              color: Colors.grey[200],
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
              CupertinoSearchTextField(
                  onTap: () {},
                  controller: searchController,
                  placeholder: "Search",    
              );
            },
          )
        ],
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(center: mapLocation, zoom: 15),
            children: [
              TileLayer(
                urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                    "{z}/{x}/{y}.png?key={apiKey}",
                additionalOptions: {"apiKey": apiKey},
              )
            ],
          )
        ],
      )),
    );
  }
}
