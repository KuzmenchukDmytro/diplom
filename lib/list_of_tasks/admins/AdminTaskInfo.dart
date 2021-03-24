class AdminTaskInfo{
  DateTime date;
  String user;
  String name;
  String comments;
  Status status;

  AdminTaskInfo(this.date, this.user, this.name, this.comments, this.status);
}

enum Status{
  assigned,
  done
}