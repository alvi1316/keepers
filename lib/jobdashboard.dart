import 'package:flutter/material.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/models/job.dart';
import 'package:keeper/widgets/drawer.dart';

class JobDashBoard extends StatefulWidget {
  const JobDashBoard({Key? key}) : super(key: key);

  @override
  State<JobDashBoard> createState() => _JobDashBoardState();
}

class _JobDashBoardState extends State<JobDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Available Jobs"),
      ),
      drawer: CustomDrawer(logout: true, jobpost: false, jobDashBoard: false),
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
                  "Available Jobs",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: Database().getAvailableJob(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Job>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    var job = snapshot.data;

                    if (job == null ? true : job.isEmpty) {
                      return Container(
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: ListTile(
                            title: Text(
                              "No job posted yet",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Column(
                          children: job.map(
                        (e) {
                          return Column(
                            children: [
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/jobdetails',
                                        arguments: e,
                                      );
                                    },
                                    title: Text(
                                      e.postedBy ?? "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Child Name:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(e.childName ?? ""),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Age:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("${e.age ?? ""}"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Week Days:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(e.weekdays ?? ""),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Time:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                "${e.startTime ?? ""} - ${e.endTime ?? ""}"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Offered Salary:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("${e.salary ?? ""}"),
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
                            ],
                          );
                        },
                      ).toList());
                    }
                  } else {
                    return Center(
                      child: Text(
                        "Error!",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
