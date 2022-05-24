import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keeper/database/globals.dart';

class Database {
  Future<bool> loginParent(String phone, String password) async {
    var result = await FirebaseFirestore.instance
        .collection('parent')
        .where('phone', isEqualTo: phone)
        .where('password', isEqualTo: password)
        .get();
    if (result.docs.isNotEmpty) {
      Global.phone = phone;
      Global.isLoggedIn = true;
      Global.name = result.docs.first.data()["name"];
      Global.userType = "parent";
    }
    return result.docs.isNotEmpty;
  }

  Future<bool> loginSitter(String phone, String password) async {
    var result = await FirebaseFirestore.instance
        .collection('sitter')
        .where('phone', isEqualTo: phone)
        .where('password', isEqualTo: password)
        .get();
    if (result.docs.isNotEmpty) {
      Global.phone = phone;
      Global.isLoggedIn = true;
      Global.name = result.docs.first.data()["name"];
      Global.userType = "sitter";
    }
    return result.docs.isNotEmpty;
  }

  Future<bool> signupSitter(
      String name, String nid, String phone, String password) async {
    Map<String, dynamic> sitterDetails = {
      "name": name,
      "nid": nid,
      "phone": phone,
      "password": password
    };
    return await FirebaseFirestore.instance
        .collection('sitter')
        .add(sitterDetails)
        .then((value) {
      return true;
    }).onError((error, stackTrace) => false);
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
