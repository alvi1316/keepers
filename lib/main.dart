import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/home.dart';
import 'package:keeper/jobdetails.dart';
import 'package:keeper/jobpost.dart';
import 'package:keeper/parentlogin.dart';
import 'package:keeper/parentprofile.dart';
import 'package:keeper/parentsignup.dart';
import 'package:keeper/sitterlogin.dart';
import 'package:keeper/sitterprofile.dart';
import 'package:keeper/sittersignup.dart';

void main() {
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
      routes: {
        '/': (context) => Home(),
        '/sitterlogin': (context) => SitterLogin(),
        '/sittersignup': (context) => SitterSignup(),
        '/sitterprofile': (context) => SitterProfile(),
        '/parentlogin': (context) => ParentLogin(),
        '/parentsignup': (context) => ParentSignup(),
        '/parentprofile': (context) => ParentProfile(),
        '/jobpost': (context) => JobPost(),
        '/jobdetails': (context) => JobDetails(),
      },
    );
  }
}
