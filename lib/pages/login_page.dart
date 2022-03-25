
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mon_projet/pages/regi_page.dart';
import 'package:mon_projet/widgets/btn_widget.dart';

import '../utils/color.dart';
import '../widgets/herder_container.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,

            child : Container(
              margin: EdgeInsets.only(left:20,right:20,top:30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _textInput(hint:"Email",icon:Icons.email),
                  _textInput(hint:"password",icon:Icons.vpn_key),
                  Container(
                    margin: EdgeInsets.only(top:10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?"
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ButtonWidget(
                        onClick: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                            builder : (context) => RegPage()
                          )
                          );
                        },
                        btnText: "LOGIN",
                      ),
                    ),
                  ),
                  RichText(
                      text:TextSpan(
                        children: [
                          TextSpan(text:"Don't have an account ?", style:TextStyle(color : Colors.black)),
                          TextSpan(text:"Registor",recognizer: new TapGestureRecognizer()..onTap = () => {
                          Navigator.push(
                          context, MaterialPageRoute(
                          builder : (context) => RegPage()
                          )
                          )
                          }, style:TextStyle(color : orangeColors)),

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
