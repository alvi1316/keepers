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

  void update() async {
    var ref = await SharedPreferences.getInstance();
    var isLoggedIn = ref.getBool("isLoggedIn");
    var name = ref.getString("name");
    var userType = ref.getString("userType");
    var phone = ref.getString("phone");
    if (isLoggedIn != null) {
      this.isLoggedIn = isLoggedIn;
    } else {
      this.isLoggedIn = false;
    }
    if (userType != null) {
      this.userType = userType;
    } else {
      this.userType = "";
    }
    if (name != null) {
      this.name = name;
    } else {
      this.name = "";
    }
    if (phone != null) {
      this.phone = phone;
    } else {
      this.phone = "";
    }
    notifyListeners();
  }
}
