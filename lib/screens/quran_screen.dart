import 'package:flutter/material.dart';

class QuranScreen extends StatelessWidget {
  static const String id = 'quran_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سور القرءان'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '1',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Text(
              'الفاتحة',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('آياتها'),
                Text('7'),
              ],
            ),
          ),
          Text('مكية'),
        ],
      ),
    );
  }
}
