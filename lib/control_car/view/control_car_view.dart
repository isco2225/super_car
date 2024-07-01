import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:super_car/control_car/widgets/control_car_info_displayer.dart';
import 'package:super_car/control_car/widgets/widgets.dart';

class ControlCarView extends StatelessWidget {
  const ControlCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ControlCarAppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ControlLeftButton(),
                ControlRightButton(),
              ],
            ),
            ControlCarInfoDisplayer(),
            SharedGap.gap4,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(4),
                  child: ControlGearButtons(),
                ),
                ControlForwardButton(),
                ControlBackButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
