import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/parent.dart';

class ChildDetails extends ConsumerStatefulWidget {
  const ChildDetails({Key? key}) : super(key: key);

  @override
  ChildDetailsState createState() => ChildDetailsState();
}

class ChildDetailsState extends ConsumerState<ChildDetails> {
  Parent parent = Parent();

  @override
  void initState() {
    super.initState();
    var session = ref.read(sessionProvider);
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
    return Column(
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
            "Child Details",
            style: TextStyle(fontSize: 26),
          ),
        ),
        Column(
          children: parent.childDetails == null
              ? []
              : parent.childDetails!.entries.map((entry) {
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
                }).toList(),
        ),
      ],
    );
  }
}
