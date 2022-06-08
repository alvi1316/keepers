import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/job.dart';

class PostedJob extends ConsumerStatefulWidget {
  const PostedJob({Key? key}) : super(key: key);

  @override
  PostedJobState createState() => PostedJobState();
}

class PostedJobState extends ConsumerState<PostedJob> {
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
            "Jobs posted",
            style: TextStyle(fontSize: 26),
          ),
        ),
        SizedBox(height: 10),
        StreamBuilder(
          stream: Database().getPostedJob(ref.read(sessionProvider).name),
          builder: (BuildContext context, AsyncSnapshot<List<Job>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
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
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
