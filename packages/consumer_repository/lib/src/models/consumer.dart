import 'package:consumer_repository/consumer_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumer.freezed.dart';
part 'consumer.g.dart';

@freezed
class Consumer with _$Consumer {
  const factory Consumer({
    required String authId,
    required String firstName,
    required String lastName,
    required String carName,
    required bool isDeletingAccount,
    required ConsumerState state,
    String? email,
  }) = _Consumer;

  factory Consumer.fromJson(Map<String, Object?> json) => _$ConsumerFromJson(
        json,
      );
  factory Consumer.empty() => const Consumer(
        authId: '',
        firstName: '',
        lastName: '',
        carName: '',
        isDeletingAccount: false,
        state: ConsumerState.empty,
      );
  factory Consumer.needRegister() => const Consumer(
        authId: '',
        email: '',
        firstName: '',
        lastName: '',
        carName: '',
        isDeletingAccount: false,
        state: ConsumerState.needRegister,
      );
}
