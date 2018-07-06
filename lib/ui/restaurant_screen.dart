import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/ui/screen.dart';
import 'package:hidden_drawer_menu/utils/utils.dart';

final Screen restaurantScreen = new Screen(
    title: 'THE PALED PADDOCK',
    background: DecorationImage(
      image: AssetImage(
        'assets/images/wood_bk.jpg',
      ),
      fit: BoxFit.cover,
    ),contentBuilder: (_){
  return ListView.builder(
      itemCount: Utils.cards.length,
      itemBuilder: (_, int index) {
        return Utils.cards[index];
      });
});