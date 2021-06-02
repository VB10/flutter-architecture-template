class UserModel {
  final String userName;
  final String userSurname;

  UserModel(this.userName, this.userSurname);

  String get shortName => '${userName[0]}${userSurname[0]}';
  String get fullName => '${userName} ${userSurname}';
  factory UserModel.fake() {
    return UserModel('Veli', 'Bacik');
  }
}
