import 'package:flutter/material.dart';

import '../utils/color.dart';

class HeaderContainer extends StatelessWidget {
var text ="Login";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [orangeColors, orangeLightColors],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter),
        borderRadius:
        BorderRadius.only(bottomLeft: Radius.circular(100)),



      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
              right: 10,
              child : Text(text,
                style: TextStyle(color : Colors.white, fontSize:20),
              )),
          Center(
            child: Image.asset("assets/logo2.png",height: 120.0,
                width: 120.0),
          ),
        ],
      ),

    );
  }
}
