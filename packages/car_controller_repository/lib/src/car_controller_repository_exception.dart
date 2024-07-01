import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_car/errors/failure.dart';

// import 'package:app_name/errors/errors.dart';

part 'car_controller_repository_exception.freezed.dart';

@freezed
sealed class CarControllerRepositoryException
    with _$CarControllerRepositoryException
    implements Failure {
  const factory CarControllerRepositoryException.unknown() =
      CarControllerRepositoryExceptionUnknown;
}
