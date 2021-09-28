import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class RosaryScreen extends StatelessWidget {
  RosaryScreen({Key? key}) : super(key: key);

  final counter = ValueNotifier(0);
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: rosaryTitle,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: smallDimens),
            child: IconButton(
              icon: const Icon(Icons.settings_backup_restore),
              onPressed: onRefreshPressed,
            ),
          )
        ],
      ),
      body: Container(
        decoration: kSecondaryBackgroundBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(mediumDimens),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: InkWell(
              onTap: onRosaryPressed,
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: counter,
                    builder: (_, count, __) => Text(
                      count.toString(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onRefreshPressed() async => counter.value = 0;

  Future<void> onRosaryPressed() async {
    counter.value++;
    // await player.play(clickSound);
    /*   final hasControl = await Vibration.hasAmplitudeControl();
    Fimber.i('hasControl= $hasControl');
    if (hasControl!) {
      await Vibration.vibrate(amplitude: 128);
    }*/
  }
}
