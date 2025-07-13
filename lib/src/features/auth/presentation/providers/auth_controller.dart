import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/core/providers.dart';
import 'package:frontend/src/core/storage/storage_service.dart';
import 'package:frontend/src/features/auth/data/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    ref.watch(authRepositoryProvider),
    ref.watch(storageServiceProvider),
  ),
);

class AuthController extends StateNotifier<bool> {
  final AuthRepository _repository;
  final StorageService _storage;
  AuthController(this._repository, this._storage) : super(false);

  Future<void> register(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = true;
    final result = await _repository.register(email, password);
    state = false;

    result.fold(
      (error) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error))),
      (user) async {
        await _storage.saveToken(user.token);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Welcome ${user.email}!")));
      },
    );
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = true;
    final result = await _repository.login(email, password);
    state = false;

    result.fold(
      (error) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error))),
      (user) async {
        await _storage.saveToken(user.token);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Logged in as ${user.email}")));
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }
}
