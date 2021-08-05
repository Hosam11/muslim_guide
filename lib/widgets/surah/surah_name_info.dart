import 'package:flutter/material.dart';

class SurahNameInfo extends StatelessWidget {
  const SurahNameInfo({
    Key key,
    @required this.title,
    @required this.number,
  }) : super(key: key);

  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          number,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
