import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:super_car/app/app.dart';
import 'package:super_car/app/widgets/widgets.dart';

import '../account_registration.dart';

class AccountRegistrationView extends StatelessWidget {
  const AccountRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      safeArea: true,
      appBar: const AccountRegistrationAppBar(),
      body: Padding(
        padding: SharedPaddings.all12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BaseColumn(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SharedGap.gap20,
                  SuperCarTextField(
                    labelText: 'First Name',
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) => context
                        .read<AccountRegistrationCubit>()
                        .updateFirstName(value),
                  ),
                  SharedGap.gap20,
                  SuperCarTextField(
                    labelText: 'Last Name',
                    onChanged: (value) => context
                        .read<AccountRegistrationCubit>()
                        .updateLastName(value),
                  ),
                  SharedGap.gap20,
                  SuperCarTextField(
                    labelText: 'Car Name',
                    onChanged: (value) => context
                        .read<AccountRegistrationCubit>()
                        .updateCarName(value),
                  ),
                ],
              ),
            ),
            GradientButton(
              text: 'Register',
              onPressed: () {
                final state = context.read<AccountRegistrationCubit>().state;
                context.read<AccountRegistrationBloc>().add(
                      AccountRegistrationEvent.registerAccount(
                        firstName: state.firstName,
                        lastName: state.lastName,
                        carName: state.carName,
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
