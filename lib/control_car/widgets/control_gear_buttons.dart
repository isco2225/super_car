import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/control_car_bloc.dart';

class ControlGearButtons extends StatelessWidget {
  const ControlGearButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControlCarBloc>().state;
    const firstGear = 1;
    const secondGear = 2;
    const thirdGear = 3;
    return Row(
      children: [
        GestureDetector(
          onTap: () =>
              context.read<ControlCarBloc>().add(const Gear(gear: firstGear)),
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              color: state.gear == firstGear ? Colors.green : Colors.grey,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                '$firstGear',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => context.read<ControlCarBloc>().add(
                const Gear(gear: secondGear),
              ),
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              color: state.gear == secondGear ? Colors.green : Colors.grey,
            ),
            child: const Center(
              child: Text(
                '$secondGear',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => context.read<ControlCarBloc>().add(
                const Gear(gear: thirdGear),
              ),
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              color: state.gear == thirdGear ? Colors.green : Colors.grey,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                '$thirdGear',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
