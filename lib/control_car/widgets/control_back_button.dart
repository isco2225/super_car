import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';

class ControlBackButton extends StatelessWidget {
  const ControlBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControlCarBloc>().state;
    return GestureDetector(
      onTapDown: (details) {
        context.read<ControlCarBloc>().add(
              const ControlCarEvent.goBackward(),
            );
      },
      onTapUp: (details) {
        context.read<ControlCarBloc>().add(
              const ControlCarEvent.clearMovement(),
            );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 75,
          width: 100,
          decoration: BoxDecoration(
            color: state.isMovementBackward ? Colors.green : Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: const Icon(
            Icons.arrow_downward_sharp,
            size: 60,
          ),
        ),
      ),
    );
  }
}
