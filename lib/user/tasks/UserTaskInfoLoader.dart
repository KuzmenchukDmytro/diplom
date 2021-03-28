import 'UserTaskInfo.dart';

class UserTaskInfoLoader{
  List<UserTaskInfo> loadInfo(){
    // TODO load tasks info from db
    var result = new List<UserTaskInfo>();
    result.add(new UserTaskInfo(1, new DateTime(2021, 1, 1), 'name1', 'comment1 123123123213123213213213123'));
    result.add(new UserTaskInfo(2, new DateTime(2021, 1, 1), 'name2', 'comment2 453343512343543512353521343'));
    result.add(new UserTaskInfo(3, new DateTime(2021, 1, 1), 'name3', 'comment3 sdfdfbfghewdadscsdgtergwefr'));
    result.add(new UserTaskInfo(4, new DateTime(2021, 1, 1), 'name4', 'comment4 cvvbhjuhrteqdwdascdfbfgnyty'));
    result.add(new UserTaskInfo(5, new DateTime(2021, 1, 1), 'name5', 'comment5 234tfgdfvfbgn56765gdvth45fg'));
    result.add(new UserTaskInfo(6, new DateTime(2021, 1, 1), 'name6', 'comment6 zcxvfnytjsaedfdfhw4terg23fd'));
    return result;
  }
}