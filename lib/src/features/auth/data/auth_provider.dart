import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_repository.dart';

// 👇 Define the provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
