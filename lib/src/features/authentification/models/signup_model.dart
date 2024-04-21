/// 회원가입 DTO
class SignupModel {
  String username;
  String email;
  String password;
  String birthday;

  SignupModel({
    required this.username,
    required this.email,
    required this.password,
    required this.birthday,
  });

  static SignupModel fromJson(Map<String, dynamic> json) {
    return SignupModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      birthday: json['birthday'],
    );
  }
}
