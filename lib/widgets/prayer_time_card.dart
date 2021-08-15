import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({
    Key? key,
    this.img,
    this.prayerName,
    this.prayerTime,
  }) : super(key: key);
  final String? img;
  final String? prayerName;
  final String? prayerTime;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => print('tap'),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(smallestDimens / 2),
                  child: SvgPicture.asset(
                    img!,
                    color: Colors.white,
                    height: 50,
                  ),
                ),
              ),
              const SizedBox(width: mediumDimens),
              Expanded(
                flex: 8,
                child: Text(prayerName!, style: const TextStyle(fontSize: 25)),
              ),
              Expanded(
                  flex: 2,
                  child: Text(prayerTime!, textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}
