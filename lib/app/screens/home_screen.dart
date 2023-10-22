import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:teens_next/app/feeds/screens/feeds_screen.dart';
import 'package:teens_next/app/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController(
    initialPage: 3,
  );

  var screens = [
    const FeedsScreen(),
    const ExploreScreen(),
    const NotificationsScreen(
      receiverUid: '',
      receiverUserEmail: '',
    )
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          resizeToAvoidBottomInset: true,
          tabBar: CupertinoTabBar(
            height: 55.0,
            activeColor: const Color.fromARGB(255, 100, 105, 255),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home_2),
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_2user)
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.notification),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return screens[index];
          },
        ),
      ),
    ]);
  }
}