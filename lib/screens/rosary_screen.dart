import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class RosaryScreen extends StatelessWidget {
  RosaryScreen({Key? key}) : super(key: key);

  final counter = ValueNotifier(0);
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: InkWell(
              onTap: () => counter.value++,
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

  void onRefreshPressed() => counter.value = 0;
}
