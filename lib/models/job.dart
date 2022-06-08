class Job {
  String? id;
  String? postedBy;
  String? childName;
  int? age;
  String? weekdays;
  String? startTime;
  String? endTime;
  String? description;
  int? salary;
  List<Map<String, String>>? appliedBy;
  String? selected;
  bool? approved;

  Job({
    this.id,
    this.postedBy,
    this.childName,
    this.age,
    this.weekdays,
    this.startTime,
    this.endTime,
    this.description,
    this.salary,
    this.appliedBy,
    this.selected,
    this.approved,
  });

  Map<String, dynamic> getMap() {
    return {
      "postedBy": postedBy,
      "childName": childName,
      "age": age,
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
