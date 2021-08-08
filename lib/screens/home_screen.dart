import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muslim_guide/constants/strings.dart' as strings;
import 'package:muslim_guide/constants/styles.dart' as styles;
import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';
import 'package:muslim_guide/widgets/categories/category_list.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String ayah = 'أُو۟لَـٰٓئِكَ عَلَىٰ هُدًى مِّن ربهم والئك هم المفلحون';

  @override
  void initState() {
    super.initState();
  }

  var customPages = AyahContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: strings.homeScreenTitle, centerTitle: true),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: styles.kSecondaryBackgroundBoxDecoration,
        child: Column(
          children: [
            /*Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: mediumPadding,
                vertical: smallPadding,
              ),
              child: RandomAyah(ayah: ayah),
            ),*/

            Expanded(child: CategoryList()),

            /*Expanded(
              child: SingleChildScrollView(
                child: CustomQuranTextView(customAyah: customPages),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
