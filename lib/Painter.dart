import 'dart:ui';

import 'package:arrowtrail/drawArrow.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  List<Offset> points = [];

  Painter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 5.0;

    DrawArrow drawArrow = DrawArrow(canvas, points, paint);
    drawArrow.drawTail();
    drawArrow.drawHead();
    // These functions Need To be Outside cuz They Need to be repainted for location changed
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
