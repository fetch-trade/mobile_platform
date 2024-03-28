import 'package:flutter/material.dart';


class UpperTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs = ["For you", "Near you"];

  UpperTabBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.transparent
      ),
      clipBehavior: Clip.hardEdge,
      child: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(48)),
            labelColor: Color.fromARGB(245, 218, 44, 93),
            tabs: tabs
                .map((label) => Container(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                    )
                )))
                .toList()),
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(28);
}
