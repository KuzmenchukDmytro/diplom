import 'AdminTaskInfo.dart';

class TaskInfoLoader{
  List<AdminTaskInfo> loadInfo(){
    var result = new List<AdminTaskInfo>();
    result.add(new AdminTaskInfo(new DateTime(2021, 1, 1), 'user1', 'name1', 'comment1 123123123213123213213213123', Status.assigned));
    result.add(new AdminTaskInfo(new DateTime(2021, 1, 1), 'user2', 'name2', 'comment2 453343512343543512353521343', Status.done));
    result.add(new AdminTaskInfo(new DateTime(2021, 1, 1), 'user3', 'name3', 'comment3 sdfdfbfghewdadscsdgtergwefr', Status.assigned));
    result.add(new AdminTaskInfo(new DateTime(2021, 1, 1), 'user4', 'name4', 'comment4 cvvbhjuhrteqdwdascdfbfgnyty', Status.done));
    result.add(new AdminTaskInfo(new DateTime(2021, 1, 1), 'user5', 'name5', 'comment5 234tfgdfvfbgn56765gdvth45fg', Status.assigned));
    result.add(new AdminTaskInfo(new DateTime(2021, 1, 1), 'user6', 'name6', 'comment6 zcxvfnytjsaedfdfhw4terg23fd', Status.done));
    return result;
  }
}