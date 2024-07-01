import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';

class ControlForwardButton extends StatelessWidget {
  const ControlForwardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControlCarBloc>().state;
    return GestureDetector(
      onTapDown: (details) {
        context.read<ControlCarBloc>().add(
              const ControlCarEvent.goForward(),
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
            color: state.isMovementForward ? Colors.green : Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: const Icon(
            Icons.arrow_upward_sharp,
            size: 60,
          ),
        ),
      ),
    );
  }
}
