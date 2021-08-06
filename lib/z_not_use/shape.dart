import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
/*
CustomPaint(
size: Size(WIDTH, (WIDTH*0.9066869937508829).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
painter: RPSCustomPainter(),
)
*/

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5000000, 0),
        Offset(size.width * 0.5000000, size.height * 0.01000000),
        [Color(0xff086d8d).withOpacity(1), Color(0xff587978).withOpacity(1)],
        [0, 1]);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.3092899, size.height * 0.3196330),
            width: size.width * 0.6185798,
            height: size.height * 0.6392660),
        paint_0_fill);

    var path_1 = Path();
    path_1.moveTo(size.width * 0.3263374, 0);
    path_1.cubicTo(
        size.width * 0.5065535,
        0,
        size.width * 0.6526747,
        size.height * 0.1587367,
        size.width * 0.6526747,
        size.height * 0.3545509);
    path_1.arcToPoint(Offset(size.width * 0.5970659, size.height * 0.5525837),
        radius:
            Radius.elliptical(size.width * 0.3175945, size.height * 0.3502801),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.arcToPoint(Offset(size.width * 0.3263374, size.height * 0.7091018),
        radius:
            Radius.elliptical(size.width * 0.3267952, size.height * 0.3604278),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.cubicTo(size.width * 0.1461212, size.height * 0.7091018, 0,
        size.height * 0.5503650, 0, size.height * 0.3545509);
    path_1.cubicTo(0, size.height * 0.1587367, size.width * 0.1461212, 0,
        size.width * 0.3263374, 0);
    path_1.close();

    var paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5000000, 0),
        Offset(size.width * 0.5000000, size.height * 0.01000000),
        [Color(0xff086d8d).withOpacity(1), Color(0xff587978).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
