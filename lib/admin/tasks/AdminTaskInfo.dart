class AdminTaskInfo{
  int taskId;
  DateTime date;
  String userId;
  String email;
  String title;
  String comments;
  Status status;

  AdminTaskInfo(this.taskId, this.date, this.userId, this.email, this.title, this.comments, this.status);

  factory AdminTaskInfo.fromJson(Map<String, dynamic> json, List<dynamic> userJson) {
    DateTime date = DateTime.parse(json['created_at']);
    Status status;
    if (json['status'] == 0) {
      status = Status.done;
    } else {
      status = Status.assigned;
    }
    return AdminTaskInfo(
      json['id'],
      date,
      json['user'].toString(),
      userJson.firstWhere((element) => element['id'] == json['user'])['email'],
      json['name'],
      json['comments'],
      status,
    );
  }
}

enum Status{
  assigned,
  done
}