import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mon_projet/pages/regi_page.dart';
import 'package:mon_projet/widgets/btn_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../second.dart';
import '../utils/color.dart';
import 'dart:convert';
import '../widgets/herder_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var passController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
                      controller: emailController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: const OutlineInputBorder(),
                          suffixIcon: const Icon(Icons.email)),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: passController,
                      obscureText: true,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: const OutlineInputBorder(),
                          suffixIcon: const Icon(Icons.vpn_key)),
                    ),
                    // _textInput(hint:"Email",icon:Icons.email),
                    // _textInput(hint:"password",icon:Icons.vpn_key),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: const Text("Forgot Password?"),
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          onClick: () {
                            login();
                          },
                          btnText: "LOGIN",
                        ),
                      ),
                    ),
                    // OutlinedButton.icon(
                    //     onPressed: () {
                    //       login();
                    //     },
                    //     icon: const Icon(Icons.login, size: 18),
                    //     label: const Text("Login")),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Don't have an account ?",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Registor",
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => RegPage()))
                                    },
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

  // create function to call login API
  Future<void> login() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://localhost:8000/auth/login/"),
          headers: {"Content-Type": "application/json"},
          body: (jsonEncode({
            "email": emailController.text,
            "password": passController.text
          })));
      print(response.statusCode);
      if (response.statusCode != 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("invalid")));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Second()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("black field not allowed")));
    }
  }
}
