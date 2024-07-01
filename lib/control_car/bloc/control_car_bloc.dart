import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:car_controller_repository/car_controller_repository.dart';
import 'package:consumer_repository/consumer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../errors/errors.dart';

part 'control_car_bloc.freezed.dart';
part 'control_car_event.dart';
part 'control_car_state.dart';

class ControlCarBloc extends Bloc<ControlCarEvent, ControlCarState> {
  ControlCarBloc({
    required ConsumerRepository consumerRepository,
    required CarControllerRepository carControllerRepository,
    required AuthRepository authRepository,
  })  : _carControllerRepository = carControllerRepository,
        _authRepository = authRepository,
        _consumerRepository = consumerRepository,
        super(const ControlCarState()) {
    on<ControlCarEvent>(_onControlCarEvent);
    _tempStreamSubscription =
        _carControllerRepository.tempStream.listen((event) {
      add(ControlCarEvent.tampUpdated(event));
    });
    _humStreamSubscription = _carControllerRepository.humStream.listen((event) {
      add(ControlCarEvent.humUpdated(event));
    });

    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      add(const ControlCarEvent.checkConnection());
    });
  }
  StreamSubscription<int>? _tempStreamSubscription;
  StreamSubscription<int>? _humStreamSubscription;
  Timer? _timer;

  final CarControllerRepository _carControllerRepository;
  final ConsumerRepository _consumerRepository;
  final AuthRepository _authRepository;
  Future<void> _onControlCarEvent(
    ControlCarEvent event,
    Emitter<ControlCarState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await event.map(
      signOut: (e) {
        _authRepository.signOut();
      },
      goForward: (e) async {
        print('goForward');
        emit(
          state.copyWith(isMovementForward: true),
        );
        final tryGoForward = await _carControllerRepository.goForward();
        tryGoForward.fold(
          (l) => emit(state.copyWith(failure: l)),
          (success) => null,
        );
      },
      goBackward: (e) async {
        print('GoBackward');
        emit(
          state.copyWith(isMovementBackward: true),
        );
        final tryGoBackward = await _carControllerRepository.goBackward();
        tryGoBackward.fold(
          (l) => emit(state.copyWith(failure: l)),
          (success) => null,
        );
      },
      directionRight: (e) async {
        print('DirectionRight');
        emit(
          state.copyWith(isDirectionRight: true),
        );
        final tryDirectionRight =
            await _carControllerRepository.directionRight();
        tryDirectionRight.fold(
          (l) => emit(state.copyWith(failure: l)),
          (success) => null,
        );
      },
      directionLeft: (e) async {
        print('DirectionLeft');
        emit(
          state.copyWith(isDirectionLeft: true),
        );
        final tryDirectionLeft = await _carControllerRepository.directionLeft();
        tryDirectionLeft.fold(
          (l) => emit(state.copyWith(failure: l)),
          (success) => null,
        );
      },
      clearDirection: (e) async {
        print('clearDirection');
        emit(
          state.copyWith(isDirectionRight: false, isDirectionLeft: false),
        );
        final tryClearDirection =
            await _carControllerRepository.clearDirection();
        tryClearDirection.fold(
          (l) => emit(state.copyWith(failure: l)),
          (success) => null,
        );
      },
      clearMovement: (e) async {
        print('clearmovement');
        emit(
          state.copyWith(isMovementBackward: false, isMovementForward: false),
        );
        final tryClearMovement = await _carControllerRepository.clearMovement();
        tryClearMovement.fold(
          (l) => emit(state.copyWith(failure: l)),
          (success) => null,
        );
      },
      gear: (e) async {
        print(e.gear);
        emit(
          state.copyWith(gear: e.gear),
        );
        final tryChangeGear = await _carControllerRepository.gear(gear: e.gear);
        tryChangeGear.fold(
          (l) => emit(state.copyWith(failure: l)),
          (success) => null,
        );
      },
      getCarName: (e) {
        print(state.carName);
        emit(
          state.copyWith(
            carName: _consumerRepository.currentConsumer!.carName,
          ),
        );
      },
      getTemperature: (e) async {
        final tryGetTemperature =
            await _carControllerRepository.watchTemperature();
        print(tryGetTemperature);
        tryGetTemperature.fold(
          (l) => emit(state.copyWith(failure: l)),
          (s) => null,
        );
      },
      tampUpdated: (e) {
        emit(
          state.copyWith(temperature: e.temp),
        );
      },
      getHumidity: (e) async {
        final tryGetHumidity = await _carControllerRepository.watchHumidity();
        print(tryGetHumidity);
        tryGetHumidity.fold(
          (l) => emit(state.copyWith(failure: l)),
          (s) => null,
        );
      },
      humUpdated: (e) {
        emit(state.copyWith(humidity: e.hum));
      },
      checkConnection: (e) async {
        final tryCheckConnectionStatus =
            await _carControllerRepository.checkConnectionStatus();
        print(tryCheckConnectionStatus);
        tryCheckConnectionStatus.fold(
          (l) => emit(state.copyWith(failure: l)),
          (connectionStatus) =>
              emit(state.copyWith(connectionStatus: connectionStatus)),
        );
      },
    );
    emit(state.copyWith(isLoading: false, failure: null));
  }

  @override
  Future<void> close() {
    _tempStreamSubscription?.cancel();
    _humStreamSubscription?.cancel();
    _timer?.cancel();
    return super.close();
  }
}
