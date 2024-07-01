import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';
import 'package:super_car/control_car/bloc_listeners/bloc_listeners.dart';


extension ControlCarErrorDisplayer on ControlCarBlocListeners {
  BlocListener<ControlCarBloc, ControlCarState> errorDisplayer() {
    return BlocListener(
      listener: (context, state) {
        final failure = state.failure;

        if (failure == null || !context.mounted) {
          return;
        }

        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            SnackBar(
              content: Text(failure.toString()),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
      },
    );
  }
}
