class UserInfo{
  int id;
  String name;
  String lastname;
  String email;
  UserRole role;

  UserInfo(this.id, this.name, this.lastname, this.email, this.role);
}

enum UserRole{
  user,
  admin
}