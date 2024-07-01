import 'package:auth_repository/auth_repository.dart';
import 'package:consumer_repository/consumer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:super_car/control_car/router/control_car_router.dart';

import '../account_initializer/account_initializer.dart';
import '../account_registration/account_registration.dart';
import '../email_verification/email_verification.dart';
import '../sign_in/sign_in.dart';
import '../sign_up/sign_up.dart';
import 'router.dart';

class AppRouter {
  factory AppRouter() {
    return instance;
  }

  AppRouter._internal();
  final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final AppRouter instance = AppRouter._internal();

  GoRouter router(Stream<dynamic> authStream, Stream<dynamic> consumerStream) =>
      GoRouter(
        debugLogDiagnostics: true,
        initialLocation: SignInRouter.instance.path,
        navigatorKey: parentNavigatorKey,
        routes: [
          // [NotSignedIn]
          SignInRouter.instance.route,
          SignUpRouter.instance.route,
          // [SignedIn] + [NotVerified]
          EmailVerificationRouter.instance.route,
          // [SignedIn] + [Verified] + User: [NotInitialized]
          AccountInitializerRouter.instance.route,
          // [SignedIn] + [Verified] + User: [NotExist]
          AccountRegistrationRouter.instance.route,
          // [SignedIn] + [Verified] + User: [ConsumerHasData]
          ControlCarRouter.instance.route,
        ],
        redirect: (BuildContext context, GoRouterState state) async {
          // Repositories
          final authRepository = context.read<AuthRepository>();
          final consumerRepository = context.read<ConsumerRepository>();

          // Current Values
          final currentAuth = authRepository.currentAuth;

          final currentConsumer = consumerRepository.currentConsumer;

          //  on [SignOut]
          if (currentAuth.state == AuthState.unAuth) {
            if (currentConsumer != null) {
              // [ClearConsumer] if [ConsumerHasData]
              consumerRepository.sinkCurrentConsumer(null);
            }
          }

          String? nonVerifiedSignedIn() {
            if (!_inEmailVerificationScreen(state)) {
              return EmailVerificationRouter.instance.path;
            }
            return null;
          }

          String? verifiedSignedInChechConsumer() {
            String? consumerHasData() {
              if (!_inConsumerScreens(state)) {
                return ControlCarRouter.instance.path;
              }
              return null;
            }

            if (currentConsumer == null) {
              return AccountInitializerRouter.instance.path;
            } else if (currentConsumer == Consumer.needRegister()) {
              return AccountRegistrationRouter.instance.path;
            } else {
              return consumerHasData();
            }
          }

          String? authNotSignedIn() {
            if (!_inAuthScreen(state)) {
              return SignInRouter.instance.path;
            }
            return null;
          }

          String? authSignedIn() {
            if (!currentAuth.isEmailVerified) {
              return nonVerifiedSignedIn();
            }
            return verifiedSignedInChechConsumer();
          }

          return switch (currentAuth.state) {
            AuthState.unAuth => authNotSignedIn(),
            AuthState.auth => authSignedIn()
          };
        },
        refreshListenable: GoRouterRefreshStream(
          stream1: authStream,
          stream2: consumerStream,
        ),
      );

  // [AuthScreens]
  bool _inAuthScreen(GoRouterState state) => [
        SignInRouter.instance.name,
        SignUpRouter.instance.name,
      ].contains(state.topRoute!.name);

  // [EmailVerificationScreen]
  bool _inEmailVerificationScreen(GoRouterState state) => [
        EmailVerificationRouter.instance.name,
      ].contains(state.topRoute!.name);

  // [AccountInitializerScreen]
  bool _inAccountInitializer(GoRouterState state) => [
        AccountInitializerRouter.instance.name,
        AccountRegistrationRouter.instance.name,
      ].contains(state.topRoute!.name);

  // [ConsumerScreens]
  bool _inConsumerScreens(GoRouterState state) => [
        ControlCarRouter.instance.name,
      ].contains(state.topRoute!.name);
}
