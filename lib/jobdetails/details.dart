import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/job.dart';

class Details extends ConsumerStatefulWidget {
  final Job job;
  const Details({Key? key, required this.job}) : super(key: key);

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends ConsumerState<Details> {
  late Job job;
  int index = 0;
  bool showApplyButton = false;
  bool showDeleteButton = false;
  bool showCancelButton = false;

  //Function to show DialogeBox
  void showDialogeBox(
      BuildContext context, String message, VoidCallback onPressed) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: Text("Okay!"),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    job = widget.job;

    var isPresent = false;

    (job.appliedBy ?? []).asMap().forEach(
      (index, value) {
        if (value["phone"] == ref.read(sessionProvider).phone) {
          isPresent = true;
          this.index = index;
        }
      },
    );

    if (ref.read(sessionProvider).userType == "sitter") {
      if (isPresent) {
        showCancelButton = true;
      } else {
        if (job.selected?.isEmpty ?? true) {
          showApplyButton = true;
        }
      }
    } else {
      showDeleteButton = true;
    }
    setState(() {});
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
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Sex:",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  Text(
                    job.sex ?? "",
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
              ListTile(
                title: Text('Address'),
                subtitle: Text(job.address ?? ""),
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
              //Show Apply Button
              if (showApplyButton)
                ListTile(
                  title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[700]!, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text("Apply"),
                    onPressed: () async {
                      var db = Database();
                      var job = this.job;
                      job.appliedBy?.add(
                        {
                          "name": ref.read(sessionProvider).name,
                          "phone": ref.read(sessionProvider).phone,
                          "rating": ref.read(sessionProvider).rating,
                        },
                      );
                      if (await db.applyForJob(job)) {
                        showApplyButton = false;
                        showCancelButton = true;
                        showDialogeBox(
                          context,
                          "Successful!",
                          () {
                            Navigator.pop(context);
                          },
                        );
                        this.job = job;
                        setState(() {});
                      } else {
                        showDialogeBox(
                          context,
                          "Failed!",
                          () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
                  ),
                ),
              if (showCancelButton)
                ListTile(
                  title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[700]!, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text("Cancel Application"),
                    onPressed: () async {
                      var job = this.job;
                      job.appliedBy?.removeAt(index);
                      Database db = Database();
                      if (await db.cancelApplicationForJob(this.job)) {
                        showCancelButton = false;
                        showApplyButton = true;
                        showDialogeBox(
                          context,
                          "Application canceled!",
                          () {
                            Navigator.pop(context);
                          },
                        );
                        this.job = job;
                        setState(() {});
                      } else {
                        showDialogeBox(
                          context,
                          "Failed!",
                          () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
                  ),
                ),
              if (showDeleteButton)
                ListTile(
                  title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[700]!, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text("Delete"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => AlertDialog(
                          title: Text(
                            "Do you really want to delete this job post?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                var db = Database();
                                Navigator.pop(context);
                                if (await db.deleteJob(job.id ?? "")) {
                                  showDialogeBox(
                                    context,
                                    "Successful!",
                                    () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  );
                                } else {
                                  showDialogeBox(
                                    context,
                                    "Failed!",
                                    () {
                                      Navigator.pop(context);
                                    },
                                  );
                                }
                              },
                              child: Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No"),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
