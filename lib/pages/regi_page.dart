import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mon_projet/widgets/btn_widget.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../second.dart';
import '../utils/color.dart';
import '../widgets/herder_container.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void sigup(String email, username, password) async {
    try {
      Response response = await post(
          Uri.parse('http://127.0.0.1:8000/auth/register/'),
          body: {'email': email, 'username': username, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        //print(data['token']);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Second()));

        print('account created successfully');
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Second()));
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "username"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "password"),
                    ),
                    // child: Column(
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: <Widget>[
                    //     _textInput(hint:"Username",icon:Icons.person),
                    //     _textInput(hint:"Email",icon:Icons.email),
                    //     _textInput(hint:"Password",icon:Icons.vpn_key),

                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER",
                          onClick: () {
                            sigup(
                                emailController.text.toString(),
                                usernameController.text.toString(),
                                passwordController.text.toString());
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already a member ?",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                              text: "Login",
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => {Navigator.pop(context)},
                              style: TextStyle(color: orangeColors)),
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

  Widget _textInput({controller, hint, icon}) {
    return (Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none, hintText: hint, prefixIcon: Icon(icon)),
      ),
    ));
  }
}
