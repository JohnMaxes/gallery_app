import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_app/core/repositories/AppUseCases.dart';
import 'package:test_app/core/repositories/FileRepository.dart';
import 'package:test_app/core/repositories/LocalRepository.dart';
import 'package:test_app/core/repositories/NetworkRepository.dart';
import 'package:test_app/core/services/ImageRecoveryService.dart';

class MockLocalRepo with Mock implements LocalRepository {}

class MockNetworkRepo with Mock implements NetworkRepository {}

class MockFileRepo with Mock implements FileRepository {}

class MockUseCases with Mock implements GalleryUseCases {}

class MockImageRecoveryService with Mock implements ImageRecoveryService {}

final mockGetIt = GetIt.instance..allowReassignment = true;
