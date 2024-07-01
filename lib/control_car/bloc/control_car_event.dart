part of 'control_car_bloc.dart';

@freezed
sealed class ControlCarEvent with _$ControlCarEvent {
  const factory ControlCarEvent.clearMovement() = ClearMovement;
  const factory ControlCarEvent.clearDirection() = ClearDirection;
  const factory ControlCarEvent.goForward() = GoForward;
  const factory ControlCarEvent.goBackward() = GoBackward;
  const factory ControlCarEvent.directionRight() = DirectionRight;
  const factory ControlCarEvent.directionLeft() = DirectionLeft;
  const factory ControlCarEvent.signOut() = SignOut;
  const factory ControlCarEvent.gear({required int gear}) = Gear;
  const factory ControlCarEvent.getCarName() = GetCarName;
  const factory ControlCarEvent.getTemperature() = GetTemperature;
  const factory ControlCarEvent.tampUpdated(int temp) = TampUpdated;
  const factory ControlCarEvent.getHumidity() = GetHumidity;
  const factory ControlCarEvent.humUpdated(int hum) = HumUpdated;
  const factory ControlCarEvent.checkConnection() = CheckConnection;
}
