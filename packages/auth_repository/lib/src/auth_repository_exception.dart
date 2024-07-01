import 'package:super_car/errors/errors.dart';

sealed class AuthRepositoryException implements Failure {
  const AuthRepositoryException();
}

class AuthRepositoryUnknown extends AuthRepositoryException {}

class AuthRepositoryInvalidInput extends AuthRepositoryException {}

class AuthRepositoryReAuthenticateInvalidCredential
    extends AuthRepositoryException {}
