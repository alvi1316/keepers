import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sessionProvider = ChangeNotifierProvider(
  (ref) {
    var session = SessionDetails();
    session.update();
    return session;
  },
);

class SessionDetails extends ChangeNotifier {
  bool isLoggedIn = false;
  String userType = "";
  String name = "";
  String phone = "";
  String rating = "";

  void update() async {
    var ref = await SharedPreferences.getInstance();
    isLoggedIn = ref.getBool("isLoggedIn") ?? false;
    userType = ref.getString("userType") ?? "";
    name = ref.getString("name") ?? "";
    phone = ref.getString("phone") ?? "";
    rating = ref.getString("rating") ?? "";
    notifyListeners();
  }
}
