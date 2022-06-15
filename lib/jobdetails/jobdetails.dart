import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/jobdetails/applicants.dart';
import 'package:keeper/jobdetails/details.dart';
import 'package:keeper/jobdetails/selectedapplicant.dart';
import 'package:keeper/models/job.dart';
import 'package:keeper/widgets/drawer.dart';

class JobDetails extends ConsumerStatefulWidget {
  final Job job;
  const JobDetails({Key? key, required this.job}) : super(key: key);

  @override
  JobDetailsState createState() => JobDetailsState();
}

class JobDetailsState extends ConsumerState<JobDetails> {
  late Job job;

  @override
  void initState() {
    super.initState();
    job = widget.job;
  }

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

  void callBack(Job job) {
    setState(() {
      this.job = job;
    });
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
              Details(job: job),
              SizedBox(height: 70),
              Applicants(
                job: job,
                callBack: callBack,
              ),
              SelectedApplicant(job: job),
            ],
          ),
        ),
      ),
    );
  }
}
