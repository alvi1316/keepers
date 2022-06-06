import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/parent.dart';
import 'package:keeper/parentprofile/childdetails.dart';
import 'package:keeper/parentprofile/paretdetails.dart';
import 'package:keeper/widgets/drawer.dart';

class ParentProfile extends ConsumerStatefulWidget {
  @override
  ParentProfileState createState() => ParentProfileState();
}

class ParentProfileState extends ConsumerState<ParentProfile> {
  Parent parent = Parent();
  late SessionDetails session;

  @override
  void initState() {
    super.initState();
    session = ref.watch(sessionProvider);
    var db = Database();
    db.getParentDetails(session.phone).then(
      (value) {
        setState(() {
          parent = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Parent Profile"),
      ),
      drawer: CustomDrawer(logout: true, jobpost: true),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Color.fromRGBO(87, 24, 158, 82),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 70),
              ParentDetails(),
              SizedBox(height: 70),
              ChildDetails(),
              SizedBox(height: 70),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  "Jobs posted",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/jobdetails');
                    },
                    title: Text(
                      'Posted By',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Child Name:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Child Name"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Age:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("5"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Week Days:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Fr, Sa, Su, Mo, Tu, We, Th"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Time:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("02.00PM - 04.00PM"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Offered Salary:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("200 Per Hour"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/jobdetails');
                    },
                    title: Text(
                      'Posted By',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Child Name:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Child Name"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Age:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("5"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Week Days:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Fr, Sa, Su, Mo, Tu, We, Th"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Time:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("02.00PM - 04.00PM"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Offered Salary:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("200 Per Hour"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
