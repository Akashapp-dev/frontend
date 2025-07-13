class UserModel {
  final int id;
  final String email;
  final String token;

  UserModel({required this.id, required this.email, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    if (user == null || json['access_token'] == null) {
      throw Exception("Missing user or access_token in response");
    }

    return UserModel(
      id: user['id'],
      email: user['email'],
      token: json['access_token'],
    );
  }
}
