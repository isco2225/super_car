import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';
import 'package:super_car/control_car/bloc_listeners/bloc_listeners.dart';
import 'package:super_car/control_car/view/control_car_view.dart';

class ControlCarScreen extends StatelessWidget {
  const ControlCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controlCarBlocListeners = ControlCarBlocListeners();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ControlCarBloc>(
          create: (context) => ControlCarBloc(
            consumerRepository: context.read(),
            carControllerRepository: context.read(),
            authRepository: context.read(),
          )
            ..add(
              const ControlCarEvent.getTemperature(),
            )
            ..add(const ControlCarEvent.getCarName())
            ..add(const ControlCarEvent.getHumidity()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          controlCarBlocListeners.errorDisplayer(),
        ],
        child: BlocSelector<ControlCarBloc, ControlCarState, bool>(
          selector: (state) => state.isLoading,
          builder: (context, isLoading) {
            return LoadingScreen(
              isLoading: isLoading,
              size: MediaQuery.sizeOf(context),
              child: const ControlCarView(),
            );
          },
        ),
      ),
    );
  }
}
