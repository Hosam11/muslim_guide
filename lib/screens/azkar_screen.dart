import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/app_data/azkar_data.dart';
import 'package:muslim_guide/widgets/zekr_card.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({
    Key? key,
    required this.isNight,
  }) : super(key: key);

  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: isNight ? azkarNightTitle : azkarMorningTitle,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kSecondaryBackgroundBoxDecoration,
        child: ListView.builder(
          itemBuilder: (_, index) => ZekrCard(
            azkar: isNight ? azkarNight[index] : azkarMorning[index],
          ),
          itemCount: isNight ? azkarNight.length : azkarMorning.length,
        ),
      ),
    );
  }
}
