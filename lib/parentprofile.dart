import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/parent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentProfile extends ConsumerStatefulWidget {
  @override
  ParentProfileState createState() => ParentProfileState();
}

class ParentProfileState extends ConsumerState<ParentProfile> {
  Parent parent = Parent();
  @override
  Widget build(BuildContext context) {
    var session = ref.watch(sessionProvider);
    var db = Database();
    db.getParentDetails(session.phone).then(
      (value) {
        setState(() {
          parent = value;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Parent Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink[800],
              ),
              child: Text(
                session.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Post Job'),
              onTap: () {
                Navigator.pushNamed(context, '/jobpost');
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Edit Profile'),
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Logout'),
              onTap: () async {
                var pref = await SharedPreferences.getInstance();
                pref.clear();
                ref.read(sessionProvider).update();
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Color.fromRGBO(87, 24, 158, 82),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
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
                  "Parent Profile Details",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Name'),
                        subtitle:
                            Text((parent.name == null) ? "" : parent.name!),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Nid'),
                        subtitle: Text((parent.nid == null) ? "" : parent.nid!),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Phone'),
                        subtitle:
                            Text((parent.phone == null) ? "" : parent.phone!),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Rating'),
                        subtitle: Text((parent.rating == null)
                            ? ""
                            : parent.rating!.toString()),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('No of child'),
                        subtitle: Text(
                          (parent.numberOfChild == null)
                              ? ""
                              : parent.numberOfChild!.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                  "Child Details",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              Column(
                  children: parent.childDetails!.entries.map((entry) {
                return Column(
                  children: [
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: ListTile(
                              title: Text('Name'),
                              subtitle: Text(entry.value["name"]),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: ListTile(
                              title: Text('Age'),
                              subtitle: Text(entry.value["age"]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList()),
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
