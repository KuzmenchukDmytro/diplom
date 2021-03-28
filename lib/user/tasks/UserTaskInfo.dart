class UserTaskInfo{
  int taskId;
  DateTime date;
  String title;
  String comments;

  UserTaskInfo(this.taskId, this.date, this.title, this.comments);
}

enum Status{
  assigned,
  done
}