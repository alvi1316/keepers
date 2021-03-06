import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends ConsumerWidget {
  final bool logout;
  final bool jobpost;
  final bool jobDashBoard;

  const CustomDrawer({
    Key? key,
    required this.logout,
    required this.jobpost,
    required this.jobDashBoard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var session = ref.watch(sessionProvider);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink[800],
            ),
            child: Text(
              session.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ),
          if (jobpost)
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Post Job'),
              onTap: () async {
                Navigator.pushNamed(context, '/jobpost');
              },
            ),
          if (jobpost)
            SizedBox(
              height: 10,
            ),
          if (jobDashBoard)
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Job Dash Board'),
              onTap: () {
                Navigator.pushNamed(context, '/jobdashboard');
              },
            ),
          if (jobDashBoard)
            SizedBox(
              height: 10,
            ),
          if (logout)
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Logout'),
              onTap: () async {
                var navigator = Navigator.of(context);
                var pref = await SharedPreferences.getInstance();
                pref.clear();
                ref.read(sessionProvider).update();
                navigator.pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          if (logout)
            SizedBox(
              height: 10,
            ),
        ],
      ),
    );
  }
}
