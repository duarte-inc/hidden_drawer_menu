import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/utils/utils.dart';

class Screen {
  final String title;
  final DecorationImage background;
  final WidgetBuilder contentBuilder;

  Screen({this.title, this.background, this.contentBuilder});
}

