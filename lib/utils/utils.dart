import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/restaurant_card.dart';

class Utils{

  static List<RestaurantCard> cards = [
    RestaurantCard(
      imageAsset: 'assets/images/eggs_in_skillet.jpg',
      title: 'Il domacca',
      icon: Icons.fastfood,
      iconBgColor: Colors.orange,
    ),
    RestaurantCard(
      imageAsset: 'assets/images/steak_on_cooktop.jpg',
      title: 'Mc Grady',
      icon: Icons.local_dining,
      iconBgColor: Colors.red,
    ),
    RestaurantCard(
      imageAsset: 'assets/images/spoons_of_spices.jpg',
      title: 'Sugar & Spice',
      icon: Icons.fastfood,
      iconBgColor: Colors.purple,
    ),
  ];
}