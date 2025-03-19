import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: NavigationBar(
        onDestinationSelected: onItemTapped,
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.task, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.image, color: Colors.white),
            label: '',
          ),
        ],
        backgroundColor: Colors.transparent,
        indicatorColor: Colors.pink.shade200,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide, // ocultando os labels
      ),
    );
  }
}