import 'package:flutter/material.dart';

import '../constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'الرئيسية',
            style: TextStyle(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
                fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Text('دليل المسلم'),
      ),
    );
  }
}
