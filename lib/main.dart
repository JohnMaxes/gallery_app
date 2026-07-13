import 'package:flutter/material.dart';
import 'package:test_app/app/GalleryApp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/core/providers/deps_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureGlobalDependencies();
  await getIt.allReady();
  runApp(const ProviderScope(child: GalleryApp()));
}
