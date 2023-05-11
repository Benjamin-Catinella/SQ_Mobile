
import 'package:flutter/material.dart';
import 'package:sg_mobile/services/service_locator.dart';
import 'package:sg_mobile/widgets/game_list_view.dart';
import 'package:sg_mobile/widgets/login.dart';
import 'package:sg_mobile/widgets/square_game_app_bar.dart';


void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        // Redirect / to /login
        '/': (context) => Scaffold(
          appBar: SquareGameAppBar(),
          resizeToAvoidBottomInset: false,
          body: LoginWidget(),
        ),
        '/login': (context) => Scaffold(
          appBar: SquareGameAppBar(),
          resizeToAvoidBottomInset: false,
          body: LoginWidget(),
        ),
        '/home': (context) => Scaffold(
          body: GameListWidget(),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.red,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.view_agenda),
                label: 'Parties en cours',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.videogame_asset),
                label: 'jeux',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Mon compte',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
          ),
        ),
      },
    );
  }
}
