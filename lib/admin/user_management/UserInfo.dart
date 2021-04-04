class UserInfo{
  int id;
  String name;
  String lastname;
  String email;
  UserRole role;

  UserInfo(this.id, this.name, this.lastname, this.email, this.role);

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    print(json);
    print(json['is_staff'] ? UserRole.admin: UserRole.user);
    return UserInfo(
      json['id'],
      json['first_name'],
      json['last_name'],
      json['email'],
      json['is_staff'] ? UserRole.admin: UserRole.user,
    );
  }
}

enum UserRole{
  user,
  admin
}