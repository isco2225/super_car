import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_car/errors/errors.dart';

part 'consumer_repository_exception.freezed.dart';

@freezed
sealed class ConsumerRepositoryException
    with _$ConsumerRepositoryException
    implements Failure {
  const factory ConsumerRepositoryException.unknown() =
      ConsumerRepositoryExceptionUnknown;
  const factory ConsumerRepositoryException.invalidInput() =
      ConsumerRepositoryExceptionInvalidInput;
  const factory ConsumerRepositoryException.nonEmptyConsumerRequired() =
      ConsumerRepositoryExceptionNonEmptyConsumerRequired;
}
