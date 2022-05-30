import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';

class SitterLogin extends ConsumerStatefulWidget {
  @override
  SitterLoginState createState() => SitterLoginState();
}

class SitterLoginState extends ConsumerState<SitterLogin> {
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(87, 24, 158, 82),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (error)
              Container(
                height: 30,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red[400],
                ),
                child: Text(
                  "Wrong username or password!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sitter Login",
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              child: Column(
                children: [
                  SizedBox(
                    width: 290,
                    child: TextField(
                      controller: phoneCtrl,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Phone",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 290,
                    child: TextField(
                      controller: passCtrl,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var navigator = Navigator.of(context);
                      var db = Database();
                      if (await db.loginSitter(phoneCtrl.text, passCtrl.text)) {
                        ref.read(sessionProvider).update();
                        navigator.pop();
                      } else {
                        setState(() {
                          error = true;
                        });
                        Timer(Duration(seconds: 5), () {
                          setState(() {
                            error = false;
                          });
                        });
                        print("Failed!");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black),
                    child: Text("Login"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.green[600],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/sittersignup');
                        },
                        child: Text('Signup!'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
