import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frontend/src/features/auth/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final _baseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:8000';

  Future<Either<String, UserModel>> register(
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print('Register response body: ${response.body}');
      // <-- ADD THIS
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Right(UserModel.fromJson(data));
      } else {
        return Left('Registration failed: ${response.body}');
      }
    } catch (e) {
      return Left('Error: ${e.toString()}');
    }
  }

  Future<Either<String, UserModel>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Right(UserModel.fromJson(data));
      } else {
        return Left('Login failed: ${response.body}');
      }
    } catch (e) {
      return Left('Error: ${e.toString()}');
    }
  }
}
