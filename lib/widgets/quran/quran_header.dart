import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/data/models/new_quran_pages/new_quran_page.dart';
import 'package:muslim_guide/helpers/quran_page_helper.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:muslim_guide/widgets/quran/page_title.dart';

class QuranHeader extends StatelessWidget {
  const QuranHeader({
    Key key,
    @required this.quranProvider,
    @required this.quranPageModel,
  }) : super(key: key);

  final QuranProvider quranProvider;
  final NewQuranPage quranPageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedOpacity(
        opacity: quranProvider.isShowDetails ? 1.0 : 0.0,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        child: PageTitle(
          right: createJuzNumber(quranPageModel.juz),
          left: quranPageModel.surahName,
        ),
      ),
    );
  }
}
