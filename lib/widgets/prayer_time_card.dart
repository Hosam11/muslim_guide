import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/constants/dimens.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({
    Key? key,
    required this.img,
    required this.prayerName,
    required this.prayerTime,
  }) : super(key: key);
  final String img;
  final String prayerName;
  final String prayerTime;
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Material(
      color: kPrimaryColor,
      borderRadius: prayerName == fajr
          ? const BorderRadius.vertical(top: Radius.circular(smallDimens))
          : prayerName == isha
              ? const BorderRadius.vertical(
                  bottom: Radius.circular(smallDimens))
              : null,
      child: Padding(
        padding: const EdgeInsets.all(smallDimens),
        child: InkWell(
          child: Row(
            children: [
              // icon
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(smallestDimens / 2),
                  child: Center(
                    child: SvgPicture.asset(
                      img,
                      color: Colors.white,
                      height: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: mediumDimens * 2),
              // prayer name
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(top: smallDimens),
                  child: Text(prayerName, style: const TextStyle(fontSize: 25)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: smallDimens),
                  child: Text(
                    prayerTime,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: isPortrait ? TextAlign.start : TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
