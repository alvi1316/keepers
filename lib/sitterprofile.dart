import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/sitter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SitterProfile extends ConsumerStatefulWidget {
  @override
  SitterProfileState createState() => SitterProfileState();
}

class SitterProfileState extends ConsumerState<SitterProfile> {
  Sitter sitter = Sitter();
  late SessionDetails session;

  @override
  void initState() {
    super.initState();
    session = ref.read(sessionProvider);
    var db = Database();
    db.getSitterDetails(session.phone).then(
      (value) {
        setState(() {
          sitter = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Sitter Profile"),
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
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
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
                  "Sitter Profile Details",
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
                            Text((sitter.name == null) ? "" : sitter.name!),
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
                        subtitle: Text((sitter.nid == null) ? "" : sitter.nid!),
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
                            Text((sitter.phone == null) ? "" : sitter.phone!),
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
                        subtitle: Text(
                          (sitter.rating == null)
                              ? ""
                              : sitter.rating!.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
