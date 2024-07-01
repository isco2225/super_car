part of 'control_car_bloc.dart';

@freezed
class ControlCarState with _$ControlCarState {
  const factory ControlCarState({
    @Default(false) bool isLoading,
    Failure? failure,
    @Default(false) bool isDirectionRight,
    @Default(false) bool isDirectionLeft,
    @Default(false) bool isMovementForward,
    @Default(false) bool isMovementBackward,
    @Default(1) int gear,
    @Default(0) int temperature,
    @Default(0) int humidity,
    @Default('') String carName,
    @Default(false) bool connectionStatus,
  }) = _ControlCarState;
}
