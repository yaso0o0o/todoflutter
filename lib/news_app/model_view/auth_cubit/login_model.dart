class LoginModel {
  final String accessToken;
  final String refreshToken;

  LoginModel({
    required this.accessToken,
    required this.refreshToken
  });

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
        accessToken: map["accessToken"],
        refreshToken: map["refreshToken"]
    );
  }
}

class LoginParameters {
  final String email;
  final String password;

  LoginParameters({
    required this.email,
    required this.password
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
    };
  }
}
