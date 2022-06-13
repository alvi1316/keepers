import 'package:flutter/material.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/models/sitter.dart';

class SitterSignup extends StatefulWidget {
  @override
  State<SitterSignup> createState() => _SitterSignupState();
}

class _SitterSignupState extends State<SitterSignup> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController nidCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController bioCtrl = TextEditingController();
  final GlobalKey<FormState> formCtrl = GlobalKey<FormState>();

  void showDialogeBox(
      BuildContext context, String msg, final VoidCallback onPressed) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(msg),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: Text("Okay!"),
          )
        ],
      ),
    );
  }

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
                        SizedBox(
                          width: 290,
                          child: TextFormField(
                            controller: bioCtrl,
                            minLines: 3,
                            maxLines: 10,
                            validator: (value) {
                              if (value == null) {
                                return "Cannot be empty";
                              } else if (value == "") {
                                return "Cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Bio",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (formCtrl.currentState!.validate()) {
                              var db = Database();
                              var sitter = Sitter(
                                name: nameCtrl.text,
                                nid: nidCtrl.text,
                                phone: phoneCtrl.text,
                                password: passCtrl.text,
                                bio: bioCtrl.text,
                                rating: 0,
                                approved: false,
                                suspended: false,
                              );

                              if (!await db.fieldIsUnique(
                                  "sitter", "phone", phoneCtrl.text)) {
                                showDialogeBox(
                                  context,
                                  "Failed! Phone Already in use!",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else if (!await db.fieldIsUnique(
                                  "sitter", "nid", nidCtrl.text)) {
                                showDialogeBox(
                                  context,
                                  "Failed! Nid Already in use!",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else if (await db.signupSitter(sitter)) {
                                showDialogeBox(
                                  context,
                                  "Successful!",
                                  () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                );
                              } else {
                                showDialogeBox(
                                  context,
                                  "Failed!",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
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
