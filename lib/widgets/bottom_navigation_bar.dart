import 'package:flutter/material.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.view_agenda),
          label: 'Parties en cours',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.videogame_asset),
          label: 'Jeux',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Mon compte',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}