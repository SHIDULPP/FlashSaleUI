import 'package:flash_sale_app/data/notifiers.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
   const NavbarWidget({super.key});

  

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          height: 70,
          backgroundColor: Colors.white,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home_outlined,color: Colors.blue,), label: ""),
            NavigationDestination(icon: Icon(Icons.heart_broken_outlined,color: Colors.blue), label: ""),
            NavigationDestination(icon: Icon(Icons.library_books_outlined,color: Colors.blue), label: ""),
            NavigationDestination(icon: Icon(Icons.shopping_bag_outlined,color: Colors.blue), label: ""),

            NavigationDestination(icon: Icon(Icons.person_outline_outlined,color: Colors.blue), label: ""),

          ],
          onDestinationSelected: (int value) {
            selectPageNotifier.value = value;
          },

          selectedIndex: selectedPage,
        );
      },
    );
  }
}
