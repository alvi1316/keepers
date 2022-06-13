class Sitter {
  String? name;
  String? nid;
  String? phone;
  String? password;
  String? bio;
  double? rating;
  bool? approved;
  bool? suspended;

  Sitter({
    this.name,
    this.nid,
    this.phone,
    this.password,
    this.bio,
    this.rating,
    this.approved,
    this.suspended,
  });

  Map<String, dynamic> getMap() {
    return {
      "name": name,
      "nid": nid,
      "phone": phone,
      "password": password,
      "bio": bio,
      "rating": rating,
      "approved": approved,
      "suspended": suspended,
    };
  }
}
