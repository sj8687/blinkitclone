class LoginModel {

  final String id;
  final String email;
  final String token;

  LoginModel({
    required this.id,
    required this.email,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {

    return LoginModel(
      id: json['id'],
      email: json['email'],
      token: json['Token'],
    );

  }

}