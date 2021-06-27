import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/args/quran_args.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/providers/quran_providder.dart';
import 'package:provider/provider.dart';

class QuranPageController extends StatelessWidget {
  final AppHelper _appHelper = AppHelper.instance;
  final QuranArgs quranArgs;

  QuranPageController({Key key, @required this.quranArgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quranPageController =
        PageController(initialPage: quranArgs.quranProvider.quranPageNumber);
    // var x = QuranPageScreen(ayah: ayah, key: UniqueKey());
    // we need list of quranPageScreen
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => QuranProvider(),
        child: SafeArea(
          child: PageView(
            controller: quranPageController,
            onPageChanged: (pageNumber) => Fimber.i('pageNumber= $pageNumber'),
            children: _appHelper.quranPageScreen,
          ),
        ),
      ),
    );
  }
}
