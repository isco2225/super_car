import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';

class ControlCarNameDisplayer extends StatelessWidget {
  const ControlCarNameDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    
    final carName = context.watch<ControlCarBloc>().state.carName;
    return Text(carName);
  }
}
