import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/ui/screen.dart';

class ZoomScaffold extends StatefulWidget {
  final Screen contentScreen;
  final Widget menuScreen;

  ZoomScaffold({this.contentScreen, this.menuScreen});

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold> {
  Widget createContentDisplay() {
    return zoomAndSlideContent(Container(
      decoration: BoxDecoration(image: widget.contentScreen.background),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            widget.contentScreen.title,
            style: TextStyle(fontSize: 24.0, fontFamily: "bebas-neue"),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ),
        body: widget.contentScreen.contentBuilder(context),
      ),
    ));
  }

  Widget zoomAndSlideContent(Widget content) {
    return Transform(
      transform: Matrix4.translationValues(272.0, 0.0, 0.0)..scale(0.8, 0.8),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color(0x44000000),
              offset: Offset(0.0, 0.5),
              blurRadius: 20.0,
              spreadRadius: 10.0)
        ]),
        child: new ClipRRect(
          child: content,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.menuScreen,
        createContentDisplay(),
      ],
    );
  }
}
class MenuController extends ChangeNotifier{
  MenuState state = MenuState.closed;
  double percentOpen = 0.0;

}
enum MenuState { open, closed, opening, closing }
