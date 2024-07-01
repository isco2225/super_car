import 'package:app_preferences_repository/app_preferences_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:car_controller_repository/car_controller_repository.dart';
import 'package:consumer_repository/consumer_repository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/models.dart';

class RepositoryDependencies {
  const RepositoryDependencies({
    required FirebaseOptions firebaseOptions,
  }) : _firebaseOptions = firebaseOptions;
  final FirebaseOptions _firebaseOptions;
  Future<Repositories> init({
    required Apis apis,
  }) async {
    final authRepository = await AuthRepositoryInitializer.initialize(
      firebaseOptions: _firebaseOptions,
    );
    final appPreferencesRepository =
        await AppPreferencesRepositoryInitializer.initialize();

    final consumerRepository = ConsumerRepository(
      remoteDatabase: apis.remoteDatabase,
    );

    final carControllerRepository = await CarControllerRepositoryInitializer.initialize(
      firebaseOptions: _firebaseOptions,
    );
    return Repositories(
      appPreferences: appPreferencesRepository,
      auth: authRepository,
      consumerRepository: consumerRepository,
      carControllerRepository: carControllerRepository,
    );
  }
}


