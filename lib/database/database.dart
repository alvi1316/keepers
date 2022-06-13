import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keeper/models/job.dart';
import 'package:keeper/models/parent.dart';
import 'package:keeper/models/sitter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
  var instance = FirebaseFirestore.instance;
  Database() {
    instance.settings = const Settings(persistenceEnabled: false);
  }

  //----------------------------------Parent------------------------------------

  Future<bool> loginParent(String phone, String password) async {
    var result = await instance
        .collection('parent')
        .where('phone', isEqualTo: phone)
        .where('password', isEqualTo: password)
        .get();
    if (result.docs.isNotEmpty) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone', phone);
      await prefs.setString('name', result.docs.first.data()["name"]);
      await prefs.setString(
          'rating', (result.docs.first.data()["rating"] as double).toString());
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userType', 'parent');
    }
    return result.docs.isNotEmpty;
  }

  Future<bool> signupParent(Parent parent) async {
    return await instance
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
    return instance
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

  Future<bool> postJob(Job job) async {
    return await instance.collection('job').add(job.getMap()).then((value) {
      return true;
    }).onError((error, stackTrace) => false);
  }

  Stream<List<Job>> getPostedJob(String phone) {
    return instance
        .collection('job')
        .where('phone', isEqualTo: phone)
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        List<Map<String, String>> l = [];
        var tl = e.get("appliedBy") as List;
        for (var t in tl) {
          var t1 = t as Map;
          var name1 = t1["name"] as String;
          var phone1 = t1["phone"] as String;
          var rating1 = t1["rating"] as String;
          Map<String, String> m = {
            "name": name1,
            "phone": phone1,
            "rating": rating1
          };
          l.add(m);
        }

        return Job(
          id: e.id,
          postedBy: e.get("postedBy"),
          phone: e.get("phone"),
          childName: e.get("childName"),
          age: e.get("age"),
          sex: e.get("sex"),
          address: e.get("address"),
          weekdays: e.get("weekdays"),
          startTime: e.get("startTime"),
          endTime: e.get("endTime"),
          salary: e.get("salary"),
          approved: e.get("approved"),
          appliedBy: l,
          description: e.get("description"),
          selected: Map.castFrom(e.get("selected")),
        );
      }).toList();
    });
  }

  Stream<List<Job>> getAvailableJob() {
    return instance.collection('job').snapshots().map((event) {
      return event.docs.map((e) {
        List<Map<String, String>> l = [];
        var tl = e.get("appliedBy") as List;
        for (var t in tl) {
          var t1 = t as Map;
          var name1 = t1["name"] as String;
          var phone1 = t1["phone"] as String;
          var rating1 = t1["rating"] as String;
          Map<String, String> m = {
            "name": name1,
            "phone": phone1,
            "rating": rating1
          };
          l.add(m);
        }

        return Job(
          id: e.id,
          postedBy: e.get("postedBy"),
          phone: e.get("phone"),
          childName: e.get("childName"),
          age: e.get("age"),
          sex: e.get("sex"),
          address: e.get("address"),
          weekdays: e.get("weekdays"),
          startTime: e.get("startTime"),
          endTime: e.get("endTime"),
          salary: e.get("salary"),
          appliedBy: l,
          approved: e.get("approved"),
          description: e.get("description"),
          selected: Map.castFrom(e.get("selected")),
        );
      }).toList();
    });
  }

  Future<bool> deleteJob(String id) async {
    return await instance
        .collection('job')
        .doc(id)
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  Future<bool> selectApplicant(String id, Map<String, String> selected) async {
    return await instance
        .collection("job")
        .doc(id)
        .update({"selected": selected, "appliedBy": []})
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  //--------------------------------Sitter--------------------------------------

  Future<bool> loginSitter(String phone, String password) async {
    var result = await instance
        .collection('sitter')
        .where('phone', isEqualTo: phone)
        .where('password', isEqualTo: password)
        .get();
    if (result.docs.isNotEmpty) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone', phone);
      await prefs.setString('name', result.docs.first.data()["name"]);
      await prefs.setString(
          'rating', (result.docs.first.data()["rating"] as double).toString());
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userType', 'sitter');
    }
    return result.docs.isNotEmpty;
  }

  Future<bool> signupSitter(Sitter sitter) async {
    return await instance
        .collection('sitter')
        .add(sitter.getMap())
        .then((value) {
      return true;
    }).onError((error, stackTrace) => false);
  }

  Future<Sitter> getSitterDetails(String phone) async {
    return instance
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
          bio: data["bio"],
          address: data["address"],
          rating: data["rating"],
          approved: data["approved"],
          suspended: data["suspended"],
        );
      },
    );
  }

  Future<bool> applyForJob(Job job) {
    return instance
        .collection("job")
        .doc(job.id)
        .update(job.getMap())
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  Future<bool> cancelApplicationForJob(Job job) {
    return instance
        .collection("job")
        .doc(job.id)
        .update(job.getMap())
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  //----------------------------------Other-------------------------------------

  Future<bool> fieldIsUnique(
      String userType, String field, String value) async {
    var doc = await instance
        .collection(userType)
        .where(field, isEqualTo: value)
        .get();
    return doc.docs.isEmpty;
  }
}
