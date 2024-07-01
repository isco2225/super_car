import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:super_car/dependencies/dependencies.dart';
import 'package:super_car/firebase_options.dart';
import 'package:super_car/startup/startup.dart';

void main() async {
  // Flutter Initializer
  WidgetsFlutterBinding.ensureInitialized();

  // Dependencies
  final apiDependencies = ApiDependencies(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );
  const configDependencies = ConfigDependencies();
  const loggerDependencies = LoggerDependencies();
  const instanceDependencies = InstanceDependencies();
  final repositoryDependencies = RepositoryDependencies(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  // Start App
  runApp(
    StartupScreen(
      apiDependencies: apiDependencies,
      configDependencies: configDependencies,
      loggerDependencies: loggerDependencies,
      instanceDependencies: instanceDependencies,
      repositoryDependencies: repositoryDependencies,
    ),
  );
}
