import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';

import 'widgets.dart';

class ControlCarInfoDisplayer extends StatelessWidget {
  const ControlCarInfoDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControlCarBloc>().state;
    final carName = state.carName;

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 47, 43, 83),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 135,
      width: 155,
      child: Column(
        children: [
          const Text(
            'Car Information',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 100,
            width: 150,
            child: Column(
              children: [
                Text(
                  carName,
                  style: const TextStyle(fontSize: 20),
                ),
                const Divider(
                  height: BorderSide.strokeAlignOutside,
                ),
                SharedGap.gap8,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TemperatureDisplayer(),
                    HumidityDisplayer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

