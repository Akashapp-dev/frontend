import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/core/providers.dart';

final authStateProvider = FutureProvider<bool>((ref) async {
  final storage = ref.read(storageServiceProvider);
  final token = await storage.readToken(); // ✅ fixed
  return token != null && token.isNotEmpty;
});
