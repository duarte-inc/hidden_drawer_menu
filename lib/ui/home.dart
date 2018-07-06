import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/ui/menu_screen.dart';
import 'package:hidden_drawer_menu/ui/restaurant_screen.dart';
import 'package:hidden_drawer_menu/ui/zoom_scaffold.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var activeScreen = restaurantScreen;

  @override
  Widget build(BuildContext context) {
    return ZoomScaffold(
      contentScreen: activeScreen,
      menuScreen: MenuScreen(),
    );
  }
}
