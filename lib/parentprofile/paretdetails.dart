import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/parent.dart';

class ParentDetails extends ConsumerStatefulWidget {
  const ParentDetails({Key? key}) : super(key: key);

  @override
  ParentDetailsState createState() => ParentDetailsState();
}

class ParentDetailsState extends ConsumerState<ParentDetails> {
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
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  title: Text('Name'),
                  subtitle: Text(parent.name ?? ""),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  title: Text('Nid'),
                  subtitle: Text(parent.nid ?? ""),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  title: Text('Phone'),
                  subtitle: Text(parent.phone ?? ""),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  title: Text('Rating'),
                  subtitle: Text(
                      (parent.rating == null) ? "" : parent.rating!.toString()),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
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
      ],
    );
  }
}
