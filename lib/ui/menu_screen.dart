import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/menu_item.dart';
import 'package:hidden_drawer_menu/ui/zoom_scaffold.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  AnimationController titleAnimationController;

  @override
  void initState() {
    super.initState();
    titleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    titleAnimationController.dispose();
    super.dispose();
  }

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

  Widget createMenuItems(MenuController menuController) {
    void onItemTapped() {
      menuController.toggle();
    }

    return Transform(
      transform: Matrix4.translationValues(0.0, 225.0, 0.0),
      child: Column(
        children: <Widget>[
          MenuItem(
            title: 'THE PADDOCK',
            isSelected: true,
            onTap: onItemTapped,
          ),
          MenuItem(
            title: 'THE HERO',
            isSelected: false,
            onTap: onItemTapped,
          ),
          MenuItem(
            title: 'HELP US GROW',
            isSelected: false,
            onTap: onItemTapped,
          ),
          MenuItem(
            title: 'SETTINGS',
            isSelected: false,
            onTap: onItemTapped,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ZoomScaffoldMenuController(
        builder: (BuildContext context, MenuController controller) {
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
              createMenuItems(controller),
            ],
          ),
        ),
      );
    });
  }
}
