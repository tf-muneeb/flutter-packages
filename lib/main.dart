import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:secure_notes_app/services/api_service.dart';
import 'package:secure_notes_app/services/storage_service.dart';
import 'app.dart';
import 'locator/service_locator.dart';
import 'models/note.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  final controllerA = getIt<NoteFormController>();
  final controllerB = getIt<NoteFormController>();
  print('Same instance? ${identical(controllerA, controllerB)}'); // false
  final storageA = getIt<StorageService>();
  final storageB = getIt<StorageService>();
  print('Same instance? ${identical(storageA, storageB)}'); // true
  final api = getIt<ApiService>();
  final created = await api.createNote(Note(userId: 1, id: 0, title: 'Test', body: 'Hello'));
  if (kDebugMode) {
    print('Created note with id: ${created.id}');
  }
  runApp(
    DevicePreview(
      enabled: !const bool.fromEnvironment('dart.vm.product'),
      builder: (context) => const MyApp(),
    ),
  );
}