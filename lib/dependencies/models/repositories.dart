import 'package:app_preferences_repository/app_preferences_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:car_controller_repository/car_controller_repository.dart';
import 'package:consumer_repository/consumer_repository.dart';

class Repositories {
  const Repositories({
    required this.appPreferences,
    required this.auth,
    required this.consumerRepository,
    required this.carControllerRepository,
  });
  final AppPreferencesRepository appPreferences;
  final AuthRepository auth;
  final ConsumerRepository consumerRepository;
  final CarControllerRepository carControllerRepository;
}
