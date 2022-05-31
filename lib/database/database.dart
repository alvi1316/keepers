import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keeper/models/parent.dart';
import 'package:keeper/models/sitter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
  Future<bool> loginParent(String phone, String password) async {
    var result = await FirebaseFirestore.instance
        .collection('parent')
        .where('phone', isEqualTo: phone)
        .where('password', isEqualTo: password)
        .get();
    if (result.docs.isNotEmpty) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone', phone);
      await prefs.setString('name', result.docs.first.data()["name"]);
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userType', 'parent');
    }
    return result.docs.isNotEmpty;
  }

  Future<bool> signupParent(Parent parent) async {
    return await FirebaseFirestore.instance
        .collection('parent')
        .add(parent.getMap())
        .then((value) {
      return true;
    }).onError((error, stackTrace) {
      print(error);
      return false;
    });
  }

  Future<Parent> getParentDetails(String phone) async {
    return FirebaseFirestore.instance
        .collection('parent')
        .where('phone', isEqualTo: phone)
        .get()
        .then(
      (value) {
        var data = value.docs.first.data();

        return Parent(
          name: data["name"],
          nid: data["nid"],
          phone: data["phone"],
          password: data["password"],
          rating: data["rating"],
          numberOfChild: data["numberOfChild"],
          childDetails: Map.castFrom(data["childDetails"]),
          approved: data["approved"],
          suspended: data["suspended"],
        );
      },
    );
  }

  Future<bool> loginSitter(String phone, String password) async {
    var result = await FirebaseFirestore.instance
        .collection('sitter')
        .where('phone', isEqualTo: phone)
        .where('password', isEqualTo: password)
        .get();
    if (result.docs.isNotEmpty) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone', phone);
      await prefs.setString('name', result.docs.first.data()["name"]);
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userType', 'sitter');
    }
    return result.docs.isNotEmpty;
  }

  Future<bool> signupSitter(Sitter sitter) async {
    return await FirebaseFirestore.instance
        .collection('sitter')
        .add(sitter.getMap())
        .then((value) {
      return true;
    }).onError((error, stackTrace) => false);
  }

  Future<Sitter> getSitterDetails(String phone) async {
    return FirebaseFirestore.instance
        .collection('sitter')
        .where('phone', isEqualTo: phone)
        .get()
        .then(
      (value) {
        var data = value.docs.first.data();
        return Sitter(
          name: data["name"],
          nid: data["nid"],
          phone: data["phone"],
          password: data["password"],
          rating: data["rating"],
          approved: data["approved"],
          suspended: data["suspended"],
        );
      },
    );
  }

  Future<bool> fieldIsUnique(
      String userType, String field, String value) async {
    var doc = await FirebaseFirestore.instance
        .collection(userType)
        .where(field, isEqualTo: value)
        .get();
    return doc.docs.isEmpty;
  }
}
