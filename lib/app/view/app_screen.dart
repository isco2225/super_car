import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_car/dependencies/models/app_dependencies.dart';

import '../app.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    required AppDependencies appDependencies,
    super.key,
  }) : _appDependencies = appDependencies;

  final AppDependencies _appDependencies;

  @override
  Widget build(BuildContext context) {
    final repositories = _appDependencies.repositories;
    final instances = _appDependencies.instances;
    final apis = _appDependencies.api;

    return MultiBlocProvider(
      providers: [
        // Services
        // Repositories
        RepositoryProvider(create: (context) => repositories.auth),
        RepositoryProvider(create: (context) => repositories.appPreferences),
        RepositoryProvider(
          create: (context) => repositories.consumerRepository,
        ),
        RepositoryProvider(
          create: (context) => repositories.carControllerRepository,
        ),
        // Apis
        RepositoryProvider(create: (context) => apis.remoteDatabase),
        // Bloc
        BlocProvider(
          create: (context) => AppBloc(
            appPreferencesRepository: repositories.appPreferences,
          ),
        ),
      ],
      child: AppView(
        routerConfig: instances.goRouter,
      ),
    );
  }
}
