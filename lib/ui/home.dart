import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/restaurant_card.dart';
import 'package:hidden_drawer_menu/utils/utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/wood_bk.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "THE PAILED PADDOCK",
            style: TextStyle(fontSize: 24.0, fontFamily: "bebas-neue"),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ),
        body: ListView.builder(
            itemCount: Utils.cards.length,
            itemBuilder: (_, int index) {
              return Utils.cards[index];
            }),
      ),
    );
  }

}
