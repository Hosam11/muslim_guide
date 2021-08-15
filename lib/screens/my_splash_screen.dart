import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/shared_prefs/perfs.dart' as prefs;
import 'package:muslim_guide/data/shared_prefs/perfs_keys.dart';
import 'package:muslim_guide/helpers/after_layout.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:muslim_guide/routes.dart';
import 'package:provider/provider.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> with AfterLayoutMixin {
  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await prepareData();
  }

  Future<void> prepareData() async {
    /*  var x = await QuranRepo.getPages();
    print('##SurahScreen## getData() data= $x');
    MUST call it before access quranPages list in repo
    await QuranRepo.instance.getPages();
    print('len= ${QuranRepo.instance.quranPages?.length}');
    */
    await prepareDataNeeded();
    await prefs.init();
    final bookmarkPageNum = prefs.getInt(key: pageNumberKey, defaultValue: -1);
    Fimber.i('bookmarkPageNum=  $bookmarkPageNum');
    final quranProvider = Provider.of<QuranProvider>(context, listen: false);
    Fimber.i('quranProvider ${quranProvider.hashCode}');

    if (bookmarkPageNum != -1) {
      quranProvider.isBookmark = true;
      quranProvider.markedPageNum = bookmarkPageNum;
    }

    await Navigator.of(context).popAndPushNamed(homeScreen);

    /*    await QuranRepo.instance.getQuranPages();
    await QuranHelper.instance.testPrepareQuranPageContents(113);

    final x = QuranRepo.instance.getQuranPage(2);
    print('numberAyahMap for page1= ${x['ayahNumberMap']}');*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kSecondaryBackgroundBoxDecoration,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(largeDimens),
            child: SvgPicture.asset(logoImg, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
