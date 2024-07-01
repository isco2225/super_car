import 'package:super_car/errors/errors.dart';

sealed class AppPreferencesRepositoryException implements Failure {
  const AppPreferencesRepositoryException();
}

class AppPreferencesRepositoryUnknown
    extends AppPreferencesRepositoryException {}
