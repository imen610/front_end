import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome User"),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app,
              ),
              label: const Text("Logout"),
            ),
          ],
        ),
      )),
    );
  }
}



// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

// import 'dart:convert';

// Post postFromJson(String str) => Post.fromJson(json.decode(str));

// String postToJson(Post data) => json.encode(data.toJson());

// class Post {
//     Post({
//         this.email,
//         this.password,
//     });

//     String email;
//     String password;

//     factory Post.fromJson(Map<String, dynamic> json) => Post(
//         email: json["email"],
//         password: json["password"],
//     );

//     Map<String, dynamic> toJson() => {
//         "email": email,
//         "password": password,
//     };
// }
