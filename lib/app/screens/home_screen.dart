import 'package:flutter/cupertino.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:fetch/app/feeds/screens/feeds_screen.dart';
import 'package:fetch/app/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController(
    initialPage: 3, // 3
  );

  var screens = [
    const FeedsScreen(),
    const ExploreScreen(),
    const NotificationsScreen(
      receiverUid: '',
      receiverUserEmail: '',
    ),
    const UserProfile()
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
      CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          resizeToAvoidBottomInset: true,
          tabBar: CupertinoTabBar(
            height: 60,
            activeColor: const Color.fromARGB(255, 218, 44, 90),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.galleryThumbnails),
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.compass)
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.bellRing),
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.user2),
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