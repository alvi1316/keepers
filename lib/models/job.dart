class Job {
  String? id;
  String? postedBy;
  String? phone;
  String? childName;
  String? sex;
  String? address;
  int? age;
  String? weekdays;
  String? startTime;
  String? endTime;
  String? description;
  int? salary;
  List<Map<String, String>>? appliedBy;
  Map<String, String>? selected;
  bool? approved;

  Job({
    this.id,
    this.phone,
    this.postedBy,
    this.childName,
    this.sex,
    this.age,
    this.weekdays,
    this.startTime,
    this.endTime,
    this.description,
    this.salary,
    this.appliedBy,
    this.selected,
    this.approved,
    this.address,
  });

  Map<String, dynamic> getMap() {
    return {
      "postedBy": postedBy,
      "phone": phone,
      "childName": childName,
      "age": age,
      "sex": sex,
      "address": address,
      "weekdays": weekdays,
      "startTime": startTime,
      "endTime": endTime,
      "description": description,
      "salary": salary,
      "appliedBy": appliedBy,
      "selected": selected,
      "approved": approved,
    };
  }
}
