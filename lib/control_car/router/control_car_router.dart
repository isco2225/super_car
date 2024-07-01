import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_car/control_car/view/control_car_screen.dart';

class ControlCarRouter {
  factory ControlCarRouter() {
    return instance;
  }
  ControlCarRouter._();
  static final ControlCarRouter instance = ControlCarRouter._();

  static const String _path = '/control_car';
  static const String _name = 'control_car';

  String get path => _path;
  String get name => _name;

  GoRoute get route => GoRoute(
        path: _path,
        name: _name,
        // parentNavigatorKey: RouterMixin.parentNavigatorKey,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ControlCarScreen(),
        ),
      );
  void go(BuildContext context) {
    GoRouter.of(context).goNamed(_name);
  }

  void push(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    GoRouter.of(context).pushNamed(_name);
  }
}
