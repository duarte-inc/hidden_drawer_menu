import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  MenuItem({this.title = "", this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0x44000000),
      onTap: isSelected ? null : () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'bebas-neue',
                fontSize: 24.0,
                letterSpacing: 2.0,
                color: isSelected ? Colors.red : Colors.white),
          ),
        ),
      ),
    );
  }
}
