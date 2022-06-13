import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/job.dart';
import 'package:keeper/widgets/drawer.dart';

// ignore: must_be_immutable
class JobDetails extends ConsumerStatefulWidget {
  Job job;
  JobDetails({Key? key, required this.job}) : super(key: key);

  @override
  JobDetailsState createState() => JobDetailsState();
}

class JobDetailsState extends ConsumerState<JobDetails> {
  void showDialogeBox(BuildContext context, String msg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(msg),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Okay!"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Job Details"),
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
                          widget.job.postedBy ?? "",
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
                          widget.job.childName ?? "",
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
                          "${widget.job.age ?? ""}",
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
                          widget.job.sex ?? "",
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    ),
                    ListTile(
                      title: Text('Week days'),
                      subtitle: Text(widget.job.weekdays ?? ""),
                    ),
                    ListTile(
                      title: Text('Time'),
                      subtitle: Column(
                        children: [
                          Row(children: [
                            Text("Start Time:"),
                            Text(widget.job.startTime ?? "")
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Text("End Time:"),
                            Text(widget.job.endTime ?? ""),
                          ]),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text('Address'),
                      subtitle: Text(widget.job.address ?? ""),
                    ),
                    ListTile(
                      title: Text('Job description'),
                      subtitle: Text(
                        widget.job.description ?? "",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    ListTile(
                      title: Text('Salary'),
                      subtitle: Text("${widget.job.salary ?? ""}"),
                    ),
                    ...(() {
                      var appliedBy = widget.job.appliedBy;
                      var index = 0;
                      var isPresent = false;
                      if (appliedBy != null) {
                        for (Map<String, String>? m in appliedBy) {
                          if (m!["phone"] == ref.read(sessionProvider).phone) {
                            isPresent = true;
                            break;
                          }
                          index++;
                        }
                      }

                      if (ref.read(sessionProvider).userType == "sitter") {
                        if (!isPresent) {
                          return <Widget>[
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
                                onPressed: () async {
                                  var db = Database();
                                  var job = widget.job;
                                  widget.job.appliedBy?.add(
                                    {
                                      "name": ref.read(sessionProvider).name,
                                      "phone": ref.read(sessionProvider).phone,
                                      "rating":
                                          ref.read(sessionProvider).rating,
                                    },
                                  );
                                  if (await db.applyForJob(widget.job)) {
                                    showDialogeBox(context, "Successful!");
                                    setState(() {});
                                  } else {
                                    showDialogeBox(context, "Failed!");
                                    widget.job = job;
                                  }
                                },
                              ),
                            )
                          ];
                        }

                        return <Widget>[
                          ListTile(
                            title: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.grey[700]!, width: 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              child: Text("Cancel Application"),
                              onPressed: () async {
                                var job = widget.job;
                                widget.job.appliedBy?.removeAt(index);
                                Database db = Database();
                                if (await db
                                    .cancelApplicationForJob(widget.job)) {
                                  showDialogeBox(
                                      context, "Application canceled!");
                                  setState(() {});
                                } else {
                                  widget.job = job;
                                  showDialogeBox(context, "Failed!");
                                }
                              },
                            ),
                          )
                        ];
                      } else {
                        if (ref.read(sessionProvider).phone ==
                            widget.job.phone) {
                          return <Widget>[
                            ListTile(
                              title: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.grey[700]!, width: 1),
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
                                            if (await db.deleteJob(
                                                widget.job.id ?? "")) {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (_) => AlertDialog(
                                                  title: Text(
                                                    "Successful!",
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Okay"),
                                                    )
                                                  ],
                                                ),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (_) => AlertDialog(
                                                  title: Text(
                                                    "Failed!",
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Okay"),
                                                    )
                                                  ],
                                                ),
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
                          ];
                        }
                        return <Widget>[];
                      }
                    }()),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 70),
              ...(() {
                if (ref.read(sessionProvider).phone == widget.job.phone &&
                    ref.read(sessionProvider).userType == "parent") {
                  return <Widget>[
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
                          if (widget.job.appliedBy != null
                              ? widget.job.appliedBy!.isEmpty
                              : false)
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: ListTile(
                                title: Text(
                                  "No applicants yet!",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ...widget.job.appliedBy?.map(
                                (e) {
                                  return Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(e["name"] ?? ""),
                                          subtitle:
                                              Text("Rating: ${e["rating"]}"),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            TextButton(
                                              child: Text('View Profile'),
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  "/applicantprofile",
                                                  arguments: e["phone"],
                                                );
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            TextButton(
                                              child: Text('Select'),
                                              onPressed: () async {
                                                var db = Database();
                                                var sitter =
                                                    await db.getSitterDetails(
                                                        e["phone"] ?? "");
                                                Map<String, String> selected = {
                                                  "name": sitter.name ?? "",
                                                  "phone": sitter.phone ?? "",
                                                  "rating":
                                                      "${sitter.rating ?? ""}",
                                                };
                                                if (await db.selectApplicant(
                                                    widget.job.id ?? "",
                                                    selected)) {
                                                  if (!mounted) return;
                                                  showDialogeBox(
                                                      context, "Successful!");
                                                  Navigator.pop(context);
                                                } else {
                                                  if (!mounted) return;
                                                  showDialogeBox(
                                                      context, "failed!");
                                                }
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ).toList() ??
                              [],
                        ],
                      ),
                    ),
                    SizedBox(height: 70),
                  ];
                } else {
                  return <Widget>[];
                }
              }()),
            ],
          ),
        ),
      ),
    );
  }
}
