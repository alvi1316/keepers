import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/job.dart';
import 'package:keeper/widgets/drawer.dart';

class JobDetails extends ConsumerWidget {
  final Job job;

  const JobDetails({super.key, required this.job});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Job Details"),
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
                  "Job details",
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
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Posted By:",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 5),
                        Text(
                          job.postedBy ?? "",
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Name of child:",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 5),
                        Text(
                          job.childName ?? "",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Age:",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${job.age ?? ""}",
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    ),
                    ListTile(
                      title: Text('Week days'),
                      subtitle: Text(job.weekdays ?? ""),
                    ),
                    ListTile(
                      title: Text('Time'),
                      subtitle: Column(
                        children: [
                          Row(children: [
                            Text("Start Time:"),
                            Text(job.startTime ?? "")
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Text("End Time:"),
                            Text(job.endTime ?? ""),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text('Job description'),
                      subtitle: Text(
                        job.description ?? "",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    ListTile(
                      title: Text('Salary'),
                      subtitle: Text("${job.salary ?? ""}"),
                    ),
                    if (ref.read(sessionProvider).name != job.postedBy)
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
                          child: Text("Apply"),
                          onPressed: () {},
                        ),
                      ),
                    SizedBox(height: 10),
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
                  "Applicants",
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
                        title: Text('Potato'),
                        subtitle: Text("Rating: 3.5"),
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
                        title: Text('Tomato'),
                        subtitle: Text("Rating: 2.5"),
                      ),
                    ),
                  ],
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
