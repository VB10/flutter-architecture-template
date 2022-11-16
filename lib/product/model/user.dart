class UserModel {

  UserModel(this.userName, this.userSurname);
  factory UserModel.fake() {
    return UserModel('Veli', 'Bacik');
  }
  final String userName;
  final String userSurname;

  String get shortName => '${userName[0]}${userSurname[0]}';
  String get fullName => '$userName $userSurname';
}
