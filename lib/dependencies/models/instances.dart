import 'package:app_preferences_repository/app_preferences_repository.dart';
import 'package:go_router/go_router.dart';

class Instances {
  const Instances({
    required this.goRouter,
    required this.appPreferences,
  });
  final GoRouter goRouter;
  final AppPreferences appPreferences;
}
