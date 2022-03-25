import 'package:flutter/material.dart';

import '../utils/color.dart';

class ButtonWidget extends StatelessWidget {
var btnText = "";
var onClick;

ButtonWidget({ required this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [orangeColors, orangeLightColors],
                end: Alignment.centerLeft,
                begin: Alignment.centerRight),
            borderRadius:
            BorderRadius.all(Radius.circular(100))
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical : 10),
        child: Text(
          btnText,
          style: TextStyle(fontSize:25 ,
              color : Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
