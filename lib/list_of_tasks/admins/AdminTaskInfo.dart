class AdminTaskInfo{
  int taskId;
  DateTime date;
  String email;
  String title;
  String comments;
  Status status;

  AdminTaskInfo(this.taskId, this.date, this.email, this.title, this.comments, this.status);
}

enum Status{
  assigned,
  done
}