import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  //const CustomNavigationBar({super.key});

  final int selectedIndex;
  final Function(int) onItemTapped;

  //Construtor da classe
  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onItemTapped,
      selectedIndex: selectedIndex,
      destinations: const <Widget>[
        NavigationDestination(icon: Icon(Icons.home), label: 'Home',),
        NavigationDestination(icon: Icon(Icons.image), label: 'Imagens',),
        NavigationDestination(icon: Icon(Icons.task), label: 'Tarefas',),
      ],
      backgroundColor: Colors.purple,
      indicatorColor: Colors.pink.shade200,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    );
  }
}
