import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed, // Add this line
      backgroundColor: const Color.fromARGB(255, 9, 11, 46),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
        BottomNavigationBarItem(
            icon: Icon(Icons.computer), label: "Technology"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      ],
    );
  }
}
