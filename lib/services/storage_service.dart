import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const String tokenKey = 'auth_token';

  /// Writes a key-value pair into secure storage.
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  /// Reads a value from secure storage by key.
  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  /// Deletes a value from secure storage by key.
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  /// Deletes all values from secure storage.
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Convenience method to save the auth token.
  Future<void> saveToken(String token) async {
    await write(key: tokenKey, value: token);
  }

  /// Convenience method to get the auth token.
  Future<String?> getToken() async {
    return await read(key: tokenKey);
  }

  /// Convenience method to delete the auth token (logout).
  Future<void> deleteToken() async {
    await delete(key: tokenKey);
  }
}