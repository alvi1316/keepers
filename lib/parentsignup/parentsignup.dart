import 'package:flutter/material.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/models/parent.dart';
import 'package:keeper/parentsignup/counter.dart';
import 'package:keeper/parentsignup/sexpicker.dart';

class ParentSignup extends StatefulWidget {
  @override
  State<ParentSignup> createState() => _ParentSignupState();
}

class _ParentSignupState extends State<ParentSignup> {
  List<String> sex = ["Male", "Female"];
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController nidCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final GlobalKey<FormState> formCtrl = GlobalKey<FormState>();

  List<TextEditingController> childCtrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(text: "Male"),
  ];

  List<Widget> childList = [];

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

  void callBack(String str) {
    childCtrl.last.text = str;
  }

  _ParentSignupState() {
    childList.add(
      Text(
        "Details of child 1",
        style: TextStyle(color: Colors.white),
      ),
    );
    childList.add(
      SizedBox(
        width: 290,
        child: Divider(
          color: Colors.white,
        ),
      ),
    );
    childList.add(
      SizedBox(
        width: 290,
        child: TextFormField(
          controller: childCtrl.elementAt(0),
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
            filled: true,
            fillColor: Colors.white,
            hintText: "Name of child",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );

    childList.add(
      SizedBox(
        height: 20,
      ),
    );
    childList.add(
      SizedBox(
        width: 290,
        child: TextFormField(
          controller: childCtrl.elementAt(1),
          validator: (value) {
            var reg = RegExp(r"^([0-9]){1,3}$");
            if (value == null) {
              return "Cannot be empty";
            } else if (value == "") {
              return "Cannot be empty";
            } else if (reg.hasMatch(value)) {
              return null;
            } else {
              return "Provide valid Age!";
            }
          },
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Age",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
    childList.add(
      SizedBox(
        height: 20,
      ),
    );

    childList.add(
      Container(
        width: 290,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: SexPicker(callback: callBack),
      ),
    );

    childList.add(
      SizedBox(
        height: 20,
      ),
    );
  }

  int _count = 1;

  void countCallback(count) {
    setState(() {
      if (count > _count) {
        childList.add(
          Text(
            "Details of child ${_count + 1}",
            style: TextStyle(color: Colors.white),
          ),
        );
        childList.add(
          SizedBox(
            width: 290,
            child: Divider(
              color: Colors.white,
            ),
          ),
        );

        childCtrl.add(TextEditingController());

        childList.add(
          SizedBox(
            width: 290,
            child: TextFormField(
              controller: childCtrl.last,
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
                filled: true,
                fillColor: Colors.white,
                hintText: "Name of child",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        );
        childList.add(
          SizedBox(
            height: 20,
          ),
        );
        childCtrl.add(TextEditingController());
        childList.add(
          SizedBox(
            width: 290,
            child: TextFormField(
              controller: childCtrl.last,
              validator: (value) {
                var reg = RegExp(r"^([0-9]){1,3}$");
                if (value == null) {
                  return "Cannot be empty";
                } else if (value == "") {
                  return "Cannot be empty";
                } else if (reg.hasMatch(value)) {
                  return null;
                } else {
                  return "Provide valid Age!";
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        );
        childList.add(
          SizedBox(
            height: 20,
          ),
        );
        childCtrl.add(TextEditingController());
        childList.add(
          Container(
            width: 290,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: SexPicker(callback: callBack),
          ),
        );
        childList.add(
          SizedBox(
            height: 20,
          ),
        );
      } else {
        childList.removeLast();
        childList.removeLast();
        childList.removeLast();
        childList.removeLast();
        childList.removeLast();
        childList.removeLast();
        childList.removeLast();
        childList.removeLast();
        childCtrl.removeLast();
        childCtrl.removeLast();
        childCtrl.removeLast();
      }
      _count = count;
    });
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
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Parent Signup",
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
                        Counter(
                          title: 'Number of children',
                          callbackFunction: countCallback,
                        ),
                        Column(children: childList),
                        ElevatedButton(
                          onPressed: () async {
                            if (formCtrl.currentState!.validate()) {
                              Map<String, Map> cd = {};
                              for (var i = 0; i < _count; i++) {
                                var cdt = {
                                  "name": childCtrl.elementAt(i * 3).text,
                                  "age": childCtrl.elementAt((i * 3) + 1).text,
                                  "sex": childCtrl.elementAt((i * 3) + 2).text,
                                };
                                cd["$i"] = cdt;
                              }

                              var db = Database();
                              var parent = Parent(
                                name: nameCtrl.text,
                                nid: nidCtrl.text,
                                phone: phoneCtrl.text,
                                password: passCtrl.text,
                                rating: 0,
                                numberOfChild: _count,
                                childDetails: cd,
                                approved: false,
                                suspended: false,
                              );
                              if (!await db.fieldIsUnique(
                                  "parent", "phone", phoneCtrl.text)) {
                                showDialogeBox(
                                  context,
                                  "Failed! Phone already in use!",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else if (!await db.fieldIsUnique(
                                  "parent", "nid", nidCtrl.text)) {
                                showDialogeBox(
                                  context,
                                  "Failed! Nid already in use!",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else if (await db.signupParent(parent)) {
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
