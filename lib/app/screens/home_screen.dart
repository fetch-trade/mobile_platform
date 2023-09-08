import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:teens_next/app/feeds/screens.dart/feeds_screen.dart';
import 'package:teens_next/app/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screens = [
    const FeedsScreen(),
    const FriendsScreen(),
    const NotificationsScreen(
      receiverUid: '', 
      receiverUserEmail: '',
    )
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
              label: "",
              icon: Icon(Iconsax.home),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Iconsax.people)
            ),
            BottomNavigationBarItem(
              label: "",
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