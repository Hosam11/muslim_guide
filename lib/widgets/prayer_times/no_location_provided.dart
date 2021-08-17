import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/constants_imports.dart';

class NoLocation extends StatelessWidget {
  const NoLocation({
    Key? key,
    @required this.onTryAgainPress,
  }) : super(key: key);

  final void Function()? onTryAgainPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(mediumDimens),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(mediumDimens),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: kSmallBorderRadius,
          border: kWhiteBorder,
        ),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  cantGetLocation,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: largeDimens),
                OutlinedButton(
                  onPressed: onTryAgainPress,
                  child: Text(
                    tryAgain,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: kTextColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
