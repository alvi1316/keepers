import 'package:flutter/material.dart';

class SitterSignup extends StatelessWidget {
  var nameCtrl = TextEditingController();
  var nidCtrl = TextEditingController();
  var phoneCtrl = TextEditingController();
  var passCtrl = TextEditingController();
  var formCtrl = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(87, 24, 158, 82),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sitter Signup",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formCtrl,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 290,
                          child: TextFormField(
                            controller: nameCtrl,
                            validator: (value) {
                              var reg = RegExp(r"^([A-Za-z ])+$");
                              if (value == null) {
                                return "Cannot be empty";
                              } else if (value == "") {
                                return "Cannot be empty";
                              } else if (reg.hasMatch(value)) {
                                return null;
                              } else {
                                return "Provide valid name!";
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Name",
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
                            controller: nidCtrl,
                            validator: (value) {
                              var reg = RegExp(r"^([0-9]){13}$");
                              if (value == null) {
                                return "Cannot be empty";
                              } else if (value == "") {
                                return "Cannot be empty";
                              } else if (reg.hasMatch(value)) {
                                return null;
                              } else {
                                return "Provide valid NID!";
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Nid",
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
                            controller: phoneCtrl,
                            validator: (value) {
                              var reg = RegExp(r"01([0-9]){9}$");
                              if (value == null) {
                                return "Cannot be empty";
                              } else if (value == "") {
                                return "Cannot be empty";
                              } else if (reg.hasMatch(value)) {
                                return null;
                              } else {
                                return "Provide valid Phone Number!";
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
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
                            validator: (value) {
                              var reg = RegExp(r"^([A-Za-z0-9]){8,}$");
                              if (value == null) {
                                return "Cannot be empty";
                              } else if (value == "") {
                                return "Cannot be empty";
                              } else if (reg.hasMatch(value)) {
                                return null;
                              } else {
                                return "8 or more character alpha numaric!";
                              }
                            },
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
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
                            if (formCtrl.currentState!.validate()) {
                              //todo
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              primary: Colors.white,
                              onPrimary: Colors.black),
                          child: Text("Signup"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.green[600],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Login!'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
