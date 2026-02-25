import 'package:blinketclone/repository/screens/cart/cartscreen.dart';
import 'package:blinketclone/repository/screens/category/categoryscreen.dart';
import 'package:blinketclone/repository/screens/home/homescreen.dart';
import 'package:blinketclone/repository/screens/print/printscreen.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class BottomNavscreen extends StatefulWidget {
  @override
  State<BottomNavscreen> createState() => _BottomNavscreenState();
}

class _BottomNavscreenState extends State<BottomNavscreen> {
  int currentindex = 0;
  List<Widget> pages = [
    BlinkitHomescreen(),
    BlinkitCategoryscreen(),
    Cartscreen(),
    Printscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentindex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: UiHelper.CustomImage(img: "home.png"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: UiHelper.CustomImage(img: "bag.png", width: 24, height: 24),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(child: UiHelper.CustomImage(img: "category.png")),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: UiHelper.CustomImage(img: "printer.png"),
            label: "Print",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
