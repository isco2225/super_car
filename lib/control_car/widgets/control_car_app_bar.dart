import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:super_car/control_car/bloc/control_car_bloc.dart';

class ControlCarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ControlCarAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final connectionStatus =
        context.watch<ControlCarBloc>().state.connectionStatus;
    return AppBar(
      actions: [
        Icon(
          connectionStatus ? Icons.wifi : Icons.wifi_off_outlined,
          color: connectionStatus ? Colors.green : Colors.red,
        ),
        SharedGap.gap8,
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.logout,
          color: Colors.red,
        ),
        onPressed: () {
          context.read<ControlCarBloc>().add(
                const ControlCarEvent.signOut(),
              );
        },
      ),
      title: const Text('control screen'),
      centerTitle: true,
      forceMaterialTransparency: true,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
