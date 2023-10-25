import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:teens_next/app/feeds/screens/user_settings.dart';
import 'package:teens_next/app/screens/user_profile.dart';
import 'package:teens_next/components/profile_gradient.dart';
import 'package:teens_next/services/auth_service.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // final TextEditingController searchController = TextEditingController();
  final MapController mapController = MapController();

  final String apiKey = "hkhhV4H2q4UKTCrrF5Hygk4HDmckVq6q";
  final mapLocation = const LatLng(29.7388, -95.758003);
  double currentZoom = 15;

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  void _zoomIn() {
    setState(() {
      currentZoom = mapController.zoom + 1.0;
      mapController.move(mapController.center, currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      currentZoom = mapController.zoom - 1.0;
      mapController.move(mapController.center, currentZoom);
    });
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
                  leadingIcon: const Icon(Iconsax.profile_circle5),
                  child: const Center(
                    child: Text(
                      "Profile",
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
                  child: const Center(
                    child: Text(
                      "Log out",
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
            /*
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
            */
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
                  SizedBox(width: 12),
                  ProfileGradient(width: 44, height: 44),
                ],
              ),
            );
          },
        ),
        title: const Text(
          "Explore",
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Capriola',
              color: Colors.black,
              fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserSettings()));
              },
              icon: const Icon(Iconsax.setting_2),
              color: Colors.black,
            ),
          ),
          /*
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
          */
        ],
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(children: [
        Expanded(
          child: GestureDetector(
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  currentZoom = mapController.zoom - details.scale / 1000.0;
                  mapController.move(mapController.center, currentZoom);
                });
              },
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: mapLocation,
                      zoom: currentZoom,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://api.tomtom.com/map/1/tile/basic/main/"
                            "{z}/{x}/{y}.png?key={apiKey}",
                        additionalOptions: {"apiKey": apiKey},
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 116,
                    left: 18,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _zoomIn,
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: _zoomOut,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        )
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 6, bottom: 66),
        child: SpeedDial(
          icon: Iconsax.box_search,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(24)),
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 255, 247, 100),
          overlayColor: Colors.white,
          overlayOpacity: 0.2,
          children: [
            SpeedDialChild(
              child: const Icon(Iconsax.user_search),
              label: "Find friends",
              labelStyle: const TextStyle(
                  color: Colors.white, fontFamily: 'Capriola', fontSize: 12),
              foregroundColor: const Color.fromARGB(255, 100, 105, 255),
              labelBackgroundColor: const Color.fromARGB(255, 100, 105, 255),
              onTap: () {},
            ),
            SpeedDialChild(
              child: const Icon(Iconsax.global_search),
              label: "Find locations",
              labelStyle: const TextStyle(
                  color: Colors.white, fontFamily: 'Capriola', fontSize: 12),
              foregroundColor: const Color.fromARGB(255, 100, 105, 255),
              labelBackgroundColor: const Color.fromARGB(255, 100, 105, 255),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
