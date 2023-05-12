import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sg_mobile/widgets/parties.dart';
import 'package:sg_mobile/widgets/square_game_app_bar.dart';
import 'account.dart';
import 'bottom_navigation_bar.dart';
import 'game_list_view.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int selectedIndex = 1;
  final List<Widget> _widgetOptions = <Widget>[
    PartiesWidget(),
    GameListWidget(),
    Account(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SquareGameAppBar(),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }

}