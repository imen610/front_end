import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mon_projet/utils/color.dart';

import 'login_page.dart';

class splushPage extends StatefulWidget {
  const splushPage({Key? key}) : super(key: key);


  @override
  State<splushPage> createState() => _splushPageState();
}

class _splushPageState extends State<splushPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000),()  {
      Navigator.push(
        context,MaterialPageRoute(builder: (context) => const LoginPage()));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [orangeColors, orangeLightColors],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,

        ),
      ),
        child: Center(
          child: Image.asset("assets/logo2.png",height: 70.0,
              width: 70.0),
        )
    ),

    );
  }

}
