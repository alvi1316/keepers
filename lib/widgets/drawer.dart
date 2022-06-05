import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends ConsumerWidget {
  final bool logout;
  final bool jobpost;

  const CustomDrawer({
    Key? key,
    required this.logout,
    required this.jobpost,
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
          if (logout)
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Logout'),
              onTap: () async {
                var pref = await SharedPreferences.getInstance();
                pref.clear();
                ref.read(sessionProvider).update();
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
