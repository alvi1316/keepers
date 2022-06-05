import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/parent.dart';
import 'package:keeper/widgets/drawer.dart';
import 'package:keeper/jobpost/timepicker.dart';
import 'package:keeper/jobpost/weekday.dart';

class JobPost extends ConsumerStatefulWidget {
  const JobPost({Key? key}) : super(key: key);

  @override
  JobPostState createState() => JobPostState();
}

class JobPostState extends ConsumerState {
  Parent parent = Parent();
  List<String> children = [];
  TextEditingController age = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController salary = TextEditingController();
  late SessionDetails session;
  String weekdays = "";
  String startTime = "";
  String endTime = "";

  void callback(String weekdays) {
    this.weekdays = weekdays;
  }

  void callback1(String startTime) {
    this.startTime = startTime;
  }

  void callback2(String endTime) {
    this.endTime = endTime;
  }

  @override
  void initState() {
    super.initState();
    session = ref.read(sessionProvider);
    var db = Database();
    db.getParentDetails(session.phone).then(
      (value) {
        setState(() {
          parent = value;
          List<String> temp = [];
          value.childDetails!.forEach((key, value) {
            temp.add(value['name']);
            children = temp;
          });
          age.text = value.childDetails!.isEmpty
              ? ""
              : value.childDetails!.values.first["age"];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("New Job"),
      ),
      drawer: CustomDrawer(logout: true, jobpost: false),
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
                  "Fill up the job details",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      ListTile(
                        title: Text('Name'),
                        subtitle: DropdownButtonFormField(
                          value: children.isEmpty ? "" : children.first,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: children.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            String val = newValue ?? "";
                            setState(() {
                              parent.childDetails!.forEach((key, value) {
                                if (value['name'] == val) {
                                  age.text = value['age'];
                                }
                              });
                            });
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Age'),
                        subtitle: TextField(
                          controller: age,
                          readOnly: true,
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
                      ListTile(
                        title: Text('Week days'),
                        subtitle: WeekDaySelector(callback: callback),
                      ),
                      ListTile(
                        title: Text('Time'),
                        subtitle: Column(
                          children: [
                            TimePicker(
                              label: "Start Time",
                              callback: callback1,
                            ),
                            SizedBox(height: 5),
                            TimePicker(
                              label: "End Time",
                              callback: callback2,
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text('Job description'),
                        subtitle: TextField(
                          controller: description,
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Salary'),
                        subtitle: TextField(
                          controller: salary,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Salary",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.grey[700]!, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Post"),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
