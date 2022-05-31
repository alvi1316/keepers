class Parent {
  String? name;
  String? nid;
  String? phone;
  String? password;
  int? numberOfChild;
  double? rating;
  bool? approved;
  bool? suspended;
  Map<String, Map>? childDetails = {};

  Parent({
    this.name,
    this.nid,
    this.phone,
    this.password,
    this.numberOfChild,
    this.rating,
    this.approved,
    this.suspended,
    this.childDetails,
  });

  Map<String, dynamic> getMap() {
    return {
      "name": name,
      "nid": nid,
      "phone": phone,
      "password": password,
      "rating": rating,
      "approved": approved,
      "suspended": suspended,
      "numberOfChild": numberOfChild,
      "childDetails": childDetails,
    };
  }
}
