import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mon_projet/widgets/btn_widget.dart';

import '../utils/color.dart';
import '../widgets/herder_container.dart';
class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("register"),
            Expanded(
              flex: 1,

              child : Container(
                margin: EdgeInsets.only(left:20,right:20,top:30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint:"Username",icon:Icons.person),
                    _textInput(hint:"Email",icon:Icons.email),
                    _textInput(hint:"Password",icon:Icons.vpn_key),

                    Expanded(
                      child: Center(
                        child: ButtonWidget(btnText: "REGISTER",
                        onClick: () {
                          Navigator.pop(context);
                        },),

                      ),
                    ),
                    RichText(
                      text:TextSpan(
                        children: [
                          TextSpan(text:"Already a member ?", style:TextStyle(color : Colors.black),),
                          TextSpan(text:"Login", recognizer: new TapGestureRecognizer()..onTap = () => {
                          Navigator.pop(context)
                          },style:TextStyle(color : orangeColors)),
                        ],

                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),

      ),

    );
  }
  Widget _textInput({controller, hint, icon}){
    return(Container(
      margin: EdgeInsets.only(top:10),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,

      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        decoration: InputDecoration(
            border : InputBorder.none,
            hintText: hint,
            prefixIcon: Icon(icon)
        ),

      ),
    )
    );
  }
}
