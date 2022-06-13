class Sitter {
  String? name;
  String? nid;
  String? phone;
  String? address;
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
    this.address,
  });

  Map<String, dynamic> getMap() {
    return {
      "name": name,
      "nid": nid,
      "phone": phone,
      "password": password,
      "bio": bio,
      "address": address,
      "rating": rating,
      "approved": approved,
      "suspended": suspended,
    };
  }
}
