import 'package:flutter/material.dart';

class ParentLogin extends StatelessWidget {
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

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
            Text(
              "Parent Login",
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
                    child: TextFormField(
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
                    child: TextFormField(
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
                    onPressed: () {
                      print(phoneCtrl.text);
                      print(passCtrl.text);
                      //todo
                      //Navigator.pushNamed(context, '/parentprofile');
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
                          Navigator.pushNamed(context, '/parentsignup');
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
