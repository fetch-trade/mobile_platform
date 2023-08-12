import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:teens_next/app/screens/screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var screens = [
    const FeedsPage(),
    const FriendsPage(),
    const NotificationsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          height: 60.0,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Iconsax.home),
            ),
            BottomNavigationBarItem(
              label: "Friends",
              icon: Icon(Iconsax.people)
            ),
            BottomNavigationBarItem(
              label: "Notifications",
              icon: Icon(Iconsax.notification),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return screens[index];
        },
      ),
    );
  }
}