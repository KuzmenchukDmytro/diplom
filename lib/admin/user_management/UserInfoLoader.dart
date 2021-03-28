import 'UserInfo.dart';

class UserInfoLoader {
  List<UserInfo> loadInfo(){
    // TODO load users list from db
    var result = new List<UserInfo>();
    result.add(new UserInfo(1, "user1", "lastname1", "email1", UserRole.user));
    result.add(new UserInfo(2, "user2", "lastname2", "email2", UserRole.user));
    result.add(new UserInfo(3, "user3", "lastname3", "email3", UserRole.user));
    result.add(new UserInfo(4, "user4", "lastname4", "email4", UserRole.admin));
    result.add(new UserInfo(5, "user5", "lastname5", "email5", UserRole.admin));
    result.add(new UserInfo(6, "user6", "lastname6", "email6", UserRole.admin));
    return result;
  }
}