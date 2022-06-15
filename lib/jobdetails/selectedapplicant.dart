import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/models/job.dart';

class SelectedApplicant extends ConsumerStatefulWidget {
  final Job job;
  const SelectedApplicant({Key? key, required this.job}) : super(key: key);

  @override
  SelectedApplicantState createState() => SelectedApplicantState();
}

class SelectedApplicantState extends ConsumerState<SelectedApplicant> {
  late Job job;
  bool showSelected = false;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    showSelected = (job.selected?.isNotEmpty ?? false) &&
        ref.read(sessionProvider).userType == "parent";

    if (showSelected) {
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
              "Current Sitter",
              style: TextStyle(fontSize: 26),
            ),
          ),
          SizedBox(height: 10),
          Card(
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
                  title: Text(job.selected?["name"] ?? ""),
                  subtitle: Text(job.selected?["rating"] ?? ""),
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
                          arguments: job.selected?["phone"] ?? "",
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: Text('Cancel contract'),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
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
