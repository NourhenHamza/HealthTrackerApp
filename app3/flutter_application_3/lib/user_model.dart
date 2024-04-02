class UserModel {
  String username;
  double age;
  String gender;
  double height;
  double weight;
  double? targetWeight;

  UserModel({
    required this.username,
    this.age = 0.0,
    this.gender = '',
    this.height = 0.0,
    this.weight = 0.0,
    this.targetWeight=0.0,
  });
}
