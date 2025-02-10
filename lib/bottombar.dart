import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(19),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navItem(0, "assets/icons/doc_tab.svg"),
                navItem(1, "assets/icons/msgs_tab.svg"),
                SizedBox(width: 56), // Space for FAB
                navItem(3, "assets/icons/search_tab.svg"),
                navItem(4, "assets/icons/profile_tab.svg"),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onItemTapped(2),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: selectedIndex == 2
                      ? Color.fromARGB(255, 0, 171, 89)
                      : Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/home_tab.svg",
                    width: 30,
                    height: 30,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem(int index, String asset) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onItemTapped(index),
        child: SvgPicture.asset(
          asset,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            selectedIndex == index
                ? Color.fromARGB(255, 0, 171, 89)
                : Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
