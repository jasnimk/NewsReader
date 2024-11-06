import 'package:flutter/material.dart';

// CustomTabBar Widget
class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> categories;
  final Function(int) onTabSelected;

  const CustomTabBar({
    Key? key,
    required this.tabController,
    required this.categories,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        indicator: BoxDecoration(), // Removes the default indicator line
        labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        onTap: onTabSelected,
        tabs: categories.map((category) {
          final isSelected = categories[tabController.index] == category;
          return Tab(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: isSelected ? Colors.blue : Colors.transparent,
                border: Border.all(
                  color: Colors.blue,
                  width: 1.5,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.blue,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
