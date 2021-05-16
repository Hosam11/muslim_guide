//
// logo and slag
/*Container(
              child: Column(
                children: [
                  // logo
                  Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 120.0,
                  ),
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
