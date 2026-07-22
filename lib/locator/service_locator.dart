import 'package:get_it/get_it.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Singletons — same instance every time
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());

  // Factory — brand new instance every time
  getIt.registerFactory<NoteFormController>(() => NoteFormController());
}

/// A deliberately trivial class just to demonstrate the factory pattern.
/// Notice it records its own creation time — that's how we'll prove
/// each call to getIt<NoteFormController>() gives back a *different* object.
class NoteFormController {
  NoteFormController() : createdAt = DateTime.now();
  final DateTime createdAt;
}