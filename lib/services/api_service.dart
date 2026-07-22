import 'package:dio/dio.dart';
import '../models/note.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: (obj) => debugPrintApi(obj),
      ),
    );
  }

  void debugPrintApi(Object? obj) {
    // ignore: avoid_print
    print('[ApiService] $obj');
  }

  // --- GET (list) ---
  Future<List<Note>> getNotes() async {
    try {
      final response = await _dio.get('/posts');
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => Note.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException(_mapDioError(e));
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // --- GET (single item by id) ---
  Future<Note> getNoteById(int id) async {
    try {
      final response = await _dio.get('/posts/$id');
      return Note.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException(_mapDioError(e));
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // --- POST (create) ---
  Future<Note> createNote(Note note) async {
    try {
      final response = await _dio.post('/posts', data: note.toJson());
      return Note.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException(_mapDioError(e));
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // --- PUT (update) ---
  Future<Note> updateNote(Note note) async {
    try {
      final response = await _dio.put('/posts/${note.id}', data: note.toJson());
      return Note.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException(_mapDioError(e));
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // --- DELETE ---
  Future<void> deleteNote(int id) async {
    try {
      final response = await _dio.delete('/posts/$id');
      if (response.statusCode != 200) {
        throw ApiException('Failed to delete note. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ApiException(_mapDioError(e));
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // --- Shared error mapping ---
  String _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return 'Connection timed out. Please check your internet connection.';
    } else if (e.type == DioExceptionType.badResponse) {
      return 'Server error: ${e.response?.statusCode}';
    } else if (e.type == DioExceptionType.connectionError) {
      return 'No internet connection.';
    }
    return 'Something went wrong: ${e.message}';
  }
}