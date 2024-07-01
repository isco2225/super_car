part of 'account_registration_bloc.dart';

@freezed
sealed class AccountRegistrationEvent with _$AccountRegistrationEvent {
  const factory AccountRegistrationEvent.registerAccount({
    required String firstName,
    required String lastName,
    required String carName,
  }) = AccountRegistrationRegisterAccount;
  const factory AccountRegistrationEvent.authStateUpdated(
    Auth updatedAuthState,
  ) = AccountRegistrationAuthStateUpdated;
}
