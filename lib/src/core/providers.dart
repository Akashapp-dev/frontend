import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/core/storage/storage_service.dart';
import 'package:frontend/src/features/auth/data/auth_repository.dart';
import 'package:http/http.dart' as http;

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final httpClientProvider = Provider((ref) => http.Client());

final baseUrlProvider = Provider<String>((ref) {
  // You can change this to your actual base URL
  return 'https://your-api-url.com';
});
