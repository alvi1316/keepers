import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/parent.dart';
import 'package:keeper/parentprofile/childdetails.dart';
import 'package:keeper/parentprofile/paretdetails.dart';
import 'package:keeper/parentprofile/postedjob.dart';
import 'package:keeper/widgets/drawer.dart';

class ParentProfile extends ConsumerStatefulWidget {
  @override
  ParentProfileState createState() => ParentProfileState();
}

class ParentProfileState extends ConsumerState<ParentProfile> {
  Parent parent = Parent();

  @override
  void initState() {
    super.initState();
    var db = Database();
    db.getParentDetails(ref.read(sessionProvider).phone).then(
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
              PostedJob(),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
