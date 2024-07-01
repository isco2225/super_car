import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';

class HumidityDisplayer extends StatelessWidget {
  const HumidityDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControlCarBloc>().state;
    final humidity = state.humidity;
    final Color humidityColor;
    if (humidity <= 30) {
      humidityColor = Colors.blue;
    } else if (humidity >= 31 && humidity < 60) {
      humidityColor = Colors.blue[400]!;
    } else {
      humidityColor = Colors.blue[900]!;
    }
    return Container(
      height: 55,
      width: 70,
      decoration: BoxDecoration(
        color: humidityColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'Humidity',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.ac_unit),
              SharedGap.gap2,
              Text(
                '%$humidity',
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
