part of 'account_registration_cubit.dart';

@freezed
class AccountRegistrationCubitState with _$AccountRegistrationCubitState {
  const factory AccountRegistrationCubitState({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String carName,
    String? errorMessage,
  }) = _AccountRegistrationCubitState;
}
