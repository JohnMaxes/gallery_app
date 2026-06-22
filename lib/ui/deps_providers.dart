import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/data/database/GalleryDatabase.dart';
import 'package:test_app/data/database/LocalRepositoryImpl.dart';
import 'package:test_app/data/filesystem/FileRepositoryImpl.dart';
import 'package:test_app/data/network/NetworkRepositoryImpl.dart';
import 'package:test_app/domain/repositories/FileRepository.dart';
import 'package:test_app/domain/repositories/LocalRepository.dart';
import 'package:test_app/domain/repositories/NetworkRepository.dart';
import 'package:test_app/domain/use_cases/GalleryUseCases.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/ui/GalleryViewModel.dart';
import 'package:test_app/ui/services/ImageRecoveryService.dart';

// GetIt providers
final getIt = GetIt.instance;

void configureGlobalDependencies() {
  getIt.registerSingleton<Dio>(Dio());
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
}

// Riverpod providers
final galleryViewModelProvider =
    NotifierProvider<GalleryViewModel, GalleryState>(GalleryViewModel.new);
