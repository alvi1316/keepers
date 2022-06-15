import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/database.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/job.dart';

class Applicants extends ConsumerStatefulWidget {
  final Job job;
  final Function callBack;
  const Applicants({
    Key? key,
    required this.job,
    required this.callBack,
  }) : super(key: key);

  @override
  ApplicantsState createState() => ApplicantsState();
}

class ApplicantsState extends ConsumerState<Applicants> {
  late Job job;
  late Function callBack;
  bool showApplicants = false;
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

    setState(() {
      job = widget.job;
      callBack = widget.callBack;
    });
  }

  @override
  Widget build(BuildContext context) {
    showApplicants = (job.appliedBy?.isNotEmpty ?? false) &&
        ref.read(sessionProvider).phone == job.phone &&
        ref.read(sessionProvider).userType == "parent";

    if (showApplicants) {
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
              "Applicants",
              style: TextStyle(fontSize: 26),
            ),
          ),
          SizedBox(height: 10),
          ...?job.appliedBy?.map(
            (element) {
              return SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(element["name"] ?? ""),
                        subtitle: Text("Rating: ${element["rating"]}"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: Text('View Profile'),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                "/applicantprofile",
                                arguments: element["phone"],
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: Text('Select'),
                            onPressed: () async {
                              var db = Database();
                              var sitter = await db
                                  .getSitterDetails(element["phone"] ?? "");
                              Map<String, String> selected = {
                                "name": sitter.name ?? "",
                                "phone": sitter.phone ?? "",
                                "rating": "${sitter.rating ?? ""}",
                              };
                              if (await db.selectApplicant(
                                  job.id ?? "", selected)) {
                                job.selected = selected;
                                job.appliedBy = [];
                                if (!mounted) return;
                                showDialogeBox(
                                  context,
                                  "Successful!",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                                callBack(job);
                              } else {
                                if (!mounted) return;
                                showDialogeBox(
                                  context,
                                  "failed!",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
          SizedBox(height: 70),
        ],
      );
    } else {
      return Column(
        children: [],
      );
    }
  }
}
