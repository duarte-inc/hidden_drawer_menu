import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/menu_item.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Widget createTitle() {
    return Transform(
      transform: Matrix4.translationValues(-100.0, 0.0, 0.0),
      child: OverflowBox(
        maxWidth: double.infinity,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "Menu",
            style: TextStyle(
                fontSize: 240.0,
                color: Color(0x88444444),
                fontFamily: "mermaid"),
            textAlign: TextAlign.left,
            softWrap: false,
          ),
        ),
      ),
    );
  }

  Widget createMenuItems() {
    return Transform(
      transform: Matrix4.translationValues(0.0, 225.0, 0.0),
      child: Column(
        children: <Widget>[
          MenuItem(
            title: 'THE PADDOCK',
            isSelected: true,
          ),
          MenuItem(
            title: 'THE HERO',
            isSelected: false,
          ),
          MenuItem(
            title: 'HELP US GROW',
            isSelected: false,
          ),
          MenuItem(
            title: 'SETTINGS',
            isSelected: false,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/dark_grunge_bk.jpg'),
        fit: BoxFit.cover,
      )),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            createTitle(),
            createMenuItems(),
          ],
        ),
      ),
    );
  }
}
