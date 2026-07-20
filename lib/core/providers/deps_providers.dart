import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/core/config/DioConfig.dart';
import 'package:test_app/core/repositories/impl/database/GalleryDatabase.dart';
import 'package:test_app/core/repositories/impl/database/LocalRepositoryImpl.dart';
import 'package:test_app/core/repositories/impl/filesystem/FileRepositoryImpl.dart';
import 'package:test_app/core/repositories/impl/network/NetworkRepositoryImpl.dart';
import 'package:test_app/core/repositories/FileRepository.dart';
import 'package:test_app/core/repositories/LocalRepository.dart';
import 'package:test_app/core/repositories/NetworkRepository.dart';
import 'package:test_app/core/repositories/AppUseCases.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/services/ImageRecoveryService.dart';

// GetIt providers
final getIt = GetIt.instance;

void configureGlobalDependencies() {
  getIt.registerSingleton<Dio>(appDio);
  getIt.registerSingletonAsync<GalleryDatabase>(() async => GalleryDatabase());

  getIt.registerSingletonWithDependencies<LocalRepository>(
    () => LocalRepositoryImpl(db: getIt()),
    dependsOn: [GalleryDatabase],
  );
  getIt.registerSingleton<NetworkRepository>(
    NetworkRepositoryImpl(dio: getIt()),
  );
  getIt.registerSingleton<FileRepository>(FileRepositoryImpl());

  getIt.registerSingletonWithDependencies(
    () => GalleryUseCases(
      localRepo: getIt(),
      networkRepo: getIt(),
      fileRepo: getIt(),
    ),
    dependsOn: [LocalRepository],
  );

  getIt.registerSingletonWithDependencies<ImageRecoveryService>(
    () => ImageRecoveryService(useCases: getIt()),
    dependsOn: [GalleryUseCases],
  );

  // getIt.registerLazy
}

// Riverpod providers
final galleryUseCasesProvider = Provider<GalleryUseCases>((ref) => getIt());
final imageRecoveryServiceProvider = Provider<ImageRecoveryService>(
  (ref) => getIt(),
);
