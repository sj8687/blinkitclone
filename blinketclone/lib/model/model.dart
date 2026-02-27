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




class Product {
  final String name;
  final int price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}





class LoginResponse {
  final String token;

  LoginResponse({required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json["token"],
    );
  }
}