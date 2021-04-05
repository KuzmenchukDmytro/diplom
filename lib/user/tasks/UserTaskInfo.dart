class UserTaskInfo{
  int taskId;
  DateTime date;
  String title;
  String comments;

  UserTaskInfo(this.taskId, this.date, this.title, this.comments);

  factory UserTaskInfo.fromJson(Map<String, dynamic> json) {
    return UserTaskInfo(
      json['id'],
      DateTime.parse(json['created_at']),
      json['name'],
      json['comments'],
    );
  }
}

enum Status{
  assigned,
  done
}