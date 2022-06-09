import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/home.dart';
import 'package:keeper/initialpage.dart';
import 'package:keeper/jobdashboard.dart';
import 'package:keeper/jobdetails.dart';
import 'package:keeper/jobpost/jobpost.dart';
import 'package:keeper/models/job.dart';
import 'package:keeper/parentlogin.dart';
import 'package:keeper/parentprofile/parentprofile.dart';
import 'package:keeper/parentsignup/parentsignup.dart';
import 'package:keeper/sitterlogin.dart';
import 'package:keeper/sitterprofile.dart';
import 'package:keeper/sittersignup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        var args = settings.arguments;
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => InitialPage());
          case '/home':
            return MaterialPageRoute(builder: (context) => Home());
          case '/sitterlogin':
            return MaterialPageRoute(builder: (context) => SitterLogin());
          case '/sittersignup':
            return MaterialPageRoute(builder: (context) => SitterSignup());
          case '/sitterprofile':
            return MaterialPageRoute(builder: (context) => SitterProfile());
          case '/parentlogin':
            return MaterialPageRoute(builder: (context) => ParentLogin());
          case '/parentsignup':
            return MaterialPageRoute(builder: (context) => ParentSignup());
          case '/parentprofile':
            return MaterialPageRoute(builder: (context) => ParentProfile());
          case '/jobpost':
            return MaterialPageRoute(builder: (context) => JobPost());
          case '/jobdetails':
            return MaterialPageRoute(
              builder: (context) => JobDetails(
                job: args as Job,
              ),
            );
          case '/jobdashboard':
            return MaterialPageRoute(builder: (context) => JobDashBoard());
          default:
            return MaterialPageRoute(builder: (context) => InitialPage());
        }
      },
    );
  }
}
