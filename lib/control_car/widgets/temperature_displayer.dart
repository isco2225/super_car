import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';

class TemperatureDisplayer extends StatelessWidget {
  const TemperatureDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControlCarBloc>().state;
    final temperature = state.temperature;
    final Color tempColor;
    if (temperature <= 17) {
      tempColor = Colors.red[200]!;
    } else if (temperature >= 18 && temperature < 30) {
      tempColor = Colors.red[400]!;
    } else {
      tempColor = Colors.red[900]!;
    }
    return Container(
      height: 55,
      width: 70,
      decoration: BoxDecoration(
        color: tempColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'temp',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.device_thermostat_sharp),
              SharedGap.gap8,
              Text(
                '$temperature°',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
