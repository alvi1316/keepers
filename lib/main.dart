import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/home.dart';
import 'package:keeper/initialpage.dart';
import 'package:keeper/jobdetails.dart';
import 'package:keeper/jobpost/jobpost.dart';
import 'package:keeper/parentlogin.dart';
import 'package:keeper/parentprofile/parentprofile.dart';
import 'package:keeper/parentsignup.dart';
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
      routes: {
        '/': (context) => InitialPage(),
        '/home': (context) => Home(),
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
