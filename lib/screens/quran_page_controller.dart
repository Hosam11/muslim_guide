import 'package:flutter/material.dart';
import 'package:muslim_guide/args/quran_args.dart';
import 'package:muslim_guide/data/app_data/quran_data.dart';

class QuranPageController extends StatelessWidget {
  final QuranArgs? quranArgs;

  QuranPageController({Key? key, required this.quranArgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quranPageController =
        PageController(initialPage: quranArgs!.pageNumber);
    // var x = QuranPageScreen(ayah: ayah, key: UniqueKey());
    // we need list of quranPageScreen
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: quranPageController,
          children: quranPageScreen,
        ),
      ),
    );
  }
}
