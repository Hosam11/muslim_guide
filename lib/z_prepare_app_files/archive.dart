//
// logo and slag
/*Container(
              child: Column(
                children: [
                  // logo
                  Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 120.0,
                 t ),
                  Text(
                    appTitle,
                    style: TextStyle(
                      fontSize: 23.0,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),*/
/* GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GridItem(
                  title: 'القرءان الكريم',
                  icon: 'assets/icons/quran.png',
                );
              },
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
            ),*/

//
// use this with chirldASpectRation in gridview
// var size = MediaQuery.of(context).size;
/*24 is for notification bar on Android*/
/*final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
final double itemWidth = size.width / 2;*/

// gridView instead of package
/*Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(16.0),
                crossAxisCount: 2,
                // scrollDirection: Axis.vertical,
                childAspectRatio: (itemWidth / itemHeight),
                mainAxisSpacing: 10.0,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: createGridView(),
              ),
            ),*/

// old grid view
/*
class GridItem extends StatelessWidget {
  final String icon;
  final String title;

  GridItem({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3.0,
        color: Color(0xFF5AADBF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Image.asset(
                  icon,
                  color: Color(0xFFC5E1D1),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(reverse: true, flip: true),
                    child: Container(
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      color: Color(0xFF5AB2CB),
                    ),
                  ),
                  Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 */

// QuranPage parser for json
/*
class QuranPage {
  final int pageNumber;
  final Map<String, String> ayahNumberMap;

  QuranPage({this.pageNumber, this.ayahNumberMap});

  @override
  String toString() {
    return 'pageNumber= $pageNumber\n'
        'ayahNumberMaps = $ayahNumberMap';
  }

  factory QuranPage.fromJson(Map<String, dynamic> json) => QuranPage(
    pageNumber: json["pageNumber"],
    ayahNumberMap: Map.from(json["ayahNumberMap"])
        .map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "pageNumber": pageNumber,
    "ayahNumberMap": Map.from(ayahNumberMap)
        .map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
*/

// surah screen
/*
         AutoSizeText(
                        pageAyahs,
                        textAlign: TextAlign.justify,
                        /*   minFontSize: ,
                        maxFontSize: ,*/
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
         */
/*Container(
          decoration: kBackgroundBoxDecoration,
          child: Column(
            children: [
              // juz and suruh name
              Container(
                color: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: smallestPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'الجزء الاول',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'الفاتحة',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // header of page
              Container(
                color: const Color(0xFFCEEFF9),
                margin: const EdgeInsets.all(smallestPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      '\uFD3F',
                      style: headerTextStyle,
                    ),
                    Text(
                      'الفاتحة',
                      style: headerTextStyle.copyWith(color: kSecondaryColor),
                    ),
                    const Text(
                      '\uFD3E',
                      style: headerTextStyle,
                    ),
                  ],
                ),
              ),
              // body of page
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'بسم الله الرحمن الرحيم',
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '\u202E$pageAyahs',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),

                    */
/*   Text(
                      pageAyahs,
                      style: const TextStyle(fontSize: 25.0),
                      maxLines: 10,
                      textAlign: TextAlign.justify,
                    ),*/
/*
                    */
/* SelectableText(
                      pageAyahs,
                      cursorColor: kPrimaryColor,
                      toolbarOptions: const ToolbarOptions(
                        copy: true,
                        selectAll: true,
                      ),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 25.0),
                    ),*/
/*
                  ],
                ),
              )
            ],
          ),
        )*/

// calc width and hi of image
/*
Future<void> printImgDimens() async {
  ByteData b = await rootBundle.load(icon);
  Uint8List uu = b.buffer.asUint8List();
  // final File image = AssetImage(icon);
  final decodedImage = await decodeImageFromList(uu);
*/
/*    Fimber.i('${decodedImage.width}');
    Fimber.i('${decodedImage.height}');*/
/*

}
*/

/*  CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: const SurahHeader(
                    surahName: 'الصفحة 106',
                    juzName: 'الحزب 13 - الربع 3',
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const SurahHeader(
                        juzName: 'الجزء الاول', surahName: 'الفاتحة'),
                    Padding(
                      padding: const EdgeInsets.all(dimens.smallPadding),
                      child: SurahNameTitle(),
                    ),
                    Text(
                      // 'asdads',
                      '\u202E$pageAyahs',
                      // pageAyahs,
                      // presetFontSizes: [25, 34],
                      style: Theme.of(context).textTheme.headline5,
                      softWrap: true,
                      // pageAyahs,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ],
            ),
          ),
          */
/*  SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: const SurahHeader(
                surahName: 'الصفحة 106',
                juzName: 'الحزب 13 - الربع 3',
              ),
            ),
          ),*/
/*
        ],
      )*/
/* SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SurahHeader(juzName: 'الجزء الاول', surahName: 'الفاتحة'),
              Padding(
                padding: const EdgeInsets.all(dimens.smallPadding),
                child: SurahNameTitle(),
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'asdads',
                          // '\u202E$pageAyahs',
                          // pageAyahs,
                          // presetFontSizes: [25, 34],
                          style: Theme.of(context).textTheme.headline5
                          const TextStyle(
                                letterSpacing: 0.0,
                                fontFamily: tajawalReg,
                                wordSpacing: 1.0,
                              )

                          ,
                          softWrap: true,
                          // pageAyahs,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SurahHeader(
                surahName: 'الصفحة 106',
                juzName: 'الحزب 13 - الربع 3',
              ),
            ],
          ),
        ),*/

/*
Widget gs() {
  var _lights = false;
  Container(
    alignment: FractionalOffset.center,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.lightbulb_outline,
            color: _lights ? Colors.yellow.shade600 : Colors.black,
            size: 60,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _lights = true;
            });
          },
          child: Container(
            color: Colors.yellow.shade600,
            padding: const EdgeInsets.all(8),
            child: const Text('TURN LIGHTS ON'),
          ),
        ),
      ],
    ),
  );
}*/

/*

class QuranPageController extends StatefulWidget {
  const QuranPageController({Key key}) : super(key: key);

  @override
  _QuranPageControllerState createState() => _QuranPageControllerState();
}

class _QuranPageControllerState extends State<QuranPageController> {
  var ayah =
      'يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوٓا۟ إِذَا تَدَايَنتُم بِدَيْنٍ إِلَىٰٓ أَجَلٍۢ مُّسَمًّۭى فَٱكْتُبُوهُ ۚ وَلْيَكْتُب بَّيْنَكُمْ كَاتِبٌۢ بِٱلْعَدْلِ ۚ وَلَا يَأْبَ كَاتِبٌ أَن يَكْتُبَ كَمَا عَلَّمَهُ ٱللَّهُ ۚ فَلْيَكْتُبْ وَلْيُمْلِلِ ٱلَّذِى عَلَيْهِ ٱلْحَقُّ وَلْيَتَّقِ ٱللَّهَ رَبَّهُۥ وَلَا يَبْخَسْ مِنْهُ شَيْـًۭٔا ۚ فَإِن كَانَ ٱلَّذِى عَلَيْهِ ٱلْحَقُّ سَفِيهًا أَوْ ضَعِيفًا أَوْ لَا يَسْتَطِيعُ أَن يُمِلَّ هُوَ فَلْيُمْلِلْ وَلِيُّهُۥ بِٱلْعَدْلِ ۚ وَٱسْتَشْهِدُوا۟ شَهِيدَيْنِ مِن رِّجَالِكُمْ ۖ فَإِن لَّمْ يَكُونَا رَجُلَيْنِ فَرَجُلٌۭ وَٱمْرَأَتَانِ مِمَّن تَرْضَوْنَ مِنَ ٱلشُّهَدَآءِ أَن تَضِلَّ إِحْدَىٰهُمَا فَتُذَكِّرَ إِحْدَىٰهُمَا ٱلْأُخْرَىٰ ۚ وَلَا يَأْبَ ٱلشُّهَدَآءُ إِذَا مَا دُعُوا۟ ۚ وَلَا تَسْـَٔمُوٓا۟ أَن تَكْتُبُوهُ صَغِيرًا أَوْ كَبِيرًا إِلَىٰٓ أَجَلِهِۦ ۚ ذَٰلِكُمْ أَقْسَطُ عِندَ ٱللَّهِ وَأَقْوَمُ لِلشَّهَٰدَةِ وَأَدْنَىٰٓ أَلَّا تَرْتَابُوٓا۟ ۖ إِلَّآ أَن تَكُونَ تِجَٰرَةً حَاضِرَةًۭ تُدِيرُونَهَا بَيْنَكُمْ فَلَيْسَ عَلَيْكُمْ جُنَاحٌ أَلَّا تَكْتُبُوهَا ۗ وَأَشْهِدُوٓا۟ إِذَا تَبَايَعْتُمْ ۚ وَلَا يُضَآرَّ كَاتِبٌۭ وَلَا شَهِيدٌۭ ۚ وَإِن تَفْعَلُوا۟ فَإِنَّهُۥ فُسُوقٌۢ بِكُمْ ۗ وَٱتَّقُوا۟ ٱللَّهَ ۖ ';
  final ayah2 =
      '۞ وَإِن كُنتُمْ عَلَىٰ سَفَرٍۢ وَلَمْ تَجِدُوا۟ كَاتِبًۭا فَرِهَٰنٌۭ مَّقْبُوضَةٌۭ ۖ فَإِنْ أَمِنَ بَعْضُكُم بَعْضًۭا فَلْيُؤَدِّ ٱلَّذِى ٱؤْتُمِنَ أَمَٰنَتَهُۥ وَلْيَتَّقِ ٱللَّهَ رَبَّهُۥ ۗ وَلَا تَكْتُمُوا۟ ٱلشَّهَٰدَةَ ۚ وَمَن ';
  final ayah3 =
      'لِّلَّهِ مَا فِى ٱلسَّمَٰوَٰتِ وَمَا فِى ٱلْأَرْضِ ۗ وَإِن تُبْدُوا۟ مَا فِىٓ أَنفُسِكُمْ أَوْ تُخْفُوهُ يُحَاسِبْكُم بِهِ ٱللَّهُ ۖ فَيَغْفِرُ لِمَن يَشَآءُ';
  final ayahList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ayahList.addAll([ayah, ayah2, ayah3]);
  }

  @override
  Widget build(BuildContext context) {
    var swipeLeft = false;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        dragStartBehavior: DragStartBehavior.down,
        excludeFromSemantics: true,
        onPanEnd: (details) {
          if (swipeLeft) {
            Fimber.i('onPanEnd swipeLeft');
            handleSwipeLeft();
          } else {
            Fimber.i('else swipeLeft');
            handleSwipeRight();
          }
        },
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            swipeLeft = false;
          } else {
            //print("Dragging in -X direction");
            swipeLeft = true;
          }
        },
        child: QuranPageScreen(ayah: ayah, key: UniqueKey()),
      ),
    );
  }

  void handleSwipeLeft() {
    setState(() {
      ayah = ayahList[2];
      Fimber.i('ayah= $ayah');
    });
  }



  void handleSwipeRight() {
    setState(() {
      ayah = ayahList[1];
      Fimber.i('ayah= $ayah');
    });
  }
}
*/
