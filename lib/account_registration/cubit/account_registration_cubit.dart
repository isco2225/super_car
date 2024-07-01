import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_registration_cubit_state.dart';
part 'account_registration_cubit.freezed.dart';

class AccountRegistrationCubit extends Cubit<AccountRegistrationCubitState> {
  AccountRegistrationCubit() : super(const AccountRegistrationCubitState());

  // Services

  // Functions
  void updateFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void updateLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }
   void updateCarName(String carName) {
    emit(state.copyWith(carName: carName));
  }
}
