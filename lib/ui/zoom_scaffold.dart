import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/ui/screen.dart';

class ZoomScaffold extends StatefulWidget {
  final Screen contentScreen;
  final Widget menuScreen;

  ZoomScaffold({this.contentScreen, this.menuScreen});

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
  MenuController menuController;
  Curve scaleDownCurve = Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = Interval(0.0, 1.0, curve: Curves.easeOut);

  @override
  void initState() {
    super.initState();
    menuController = new MenuController(vsync: this)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

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
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                menuController.toggle();
              }),
        ),
        body: widget.contentScreen.contentBuilder(context),
      ),
    ));
  }

  Widget zoomAndSlideContent(Widget content) {
    var slidePercent;
    var scalePercent;
    switch(menuController.state){
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(menuController.percentOpen);
        scalePercent = scaleUpCurve.transform(menuController.percentOpen);
        break;
    }

    final slideAmount = 275 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final borderRadius = 10.0 * menuController.percentOpen;

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
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
          borderRadius: BorderRadius.circular(borderRadius),
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

class ZoomScaffoldMenuController extends StatelessWidget {
  final ZoomScaffoldBuilder builder;

  ZoomScaffoldMenuController({this.builder});

  getMenuController(BuildContext context) {
    final scaffoldState =
        context.ancestorStateOfType(new TypeMatcher<_ZoomScaffoldState>())
            as _ZoomScaffoldState;
    return scaffoldState.menuController;
  }

  @override
  Widget build(BuildContext context) {
    return builder(context, getMenuController(context));
  }
}

typedef Widget ZoomScaffoldBuilder(
    BuildContext context, MenuController controller);

class MenuController extends ChangeNotifier {
  MenuState state = MenuState.closed;
  final TickerProviderStateMixin vsync;
  final AnimationController animationController;

  MenuController({this.vsync})
      : animationController = new AnimationController(vsync: vsync) {
    animationController
      ..duration = Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return animationController.value;
  }

  open() {
    animationController.forward();
  }

  close() {
    animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else {
      open();
    }
  }
}

enum MenuState { open, closed, opening, closing }
