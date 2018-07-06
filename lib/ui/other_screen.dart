import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/ui/screen.dart';

final otherScreen = Screen(
    title: 'OTHER SCREEN',
    background: DecorationImage(
        image: AssetImage('assets/images/other_screen_bk.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Color(0xCC000000), BlendMode.multiply)),
    contentBuilder: (BuildContext context) {
      return Center(
        child: Container(
          height: 300.0,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/other_screen_card_photo.jpg'),
                  Expanded(
                    child: Center(
                      child: Text("This is another screen"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
