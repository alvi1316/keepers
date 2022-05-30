class Parent {
  String? name;
  String? nid;
  String? phone;
  String? password;
  int? numberOfChild;
  double? rating;
  bool? approved;
  bool? suspended;
  Map<String, dynamic>? childDetails = {};

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
}
