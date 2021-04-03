class AdminTaskInfo{
  int taskId;
  DateTime date;
  String email;
  String title;
  String comments;
  Status status;

  AdminTaskInfo(this.taskId, this.date, this.email, this.title, this.comments, this.status);

  factory AdminTaskInfo.fromJson(Map<String, dynamic> json) {
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
      json['name'],
      json['comments'],
      status,
    );
  }

  /*Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
  };*/
}

enum Status{
  assigned,
  done
}