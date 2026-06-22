import 'package:flutter/material.dart';
import 'package:test_app/ui/GalleryApp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/deps_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureGlobalDependencies();
  await getIt.allReady();
  runApp(const ProviderScope(child: GalleryApp()));
}
