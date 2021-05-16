import 'dart:ui';

import 'package:arrowtrail/rotation.dart';
import 'package:flutter/material.dart';

class DrawArrow {
  Canvas canvas;
  List<Offset> points;
  Paint paint;
  DrawArrow(this.canvas, this.points, this.paint);

  void drawTail() {
    double dist = 0;
    int len = points.length;
    for (int x = len - 1; x > 0; x--) {
      if (points[x] != Offset.infinite && points[x - 1] != Offset.infinite) {
        dist += (points[x] - points[x - 1]).distance;
        if (dist <= 400) {
          canvas.drawLine(points[x], points[x - 1], paint);
        }
      } else if (points[x - 1] != Offset.infinite &&
          points[x] == Offset.infinite) {
        canvas.drawPoints(PointMode.points, [points[x]], paint); // If its a tap
      }
    }
  }

  void drawTriangle(double x, double y, double length, double angle) {
    var p1 = rotateByAngle(-1 * (length / 2) + x, -1 * length + y, x, y, angle);
    var p2 = rotateByAngle((length / 2) + x, -1 * length + y, x, y, angle);
    var p0 = [x, y];
    // if angle is 0 :
    //                                  ^                          It gives this kind of a triangle(equilateral)
    //                               /     \
    //                             /         \                   So rotations are made about the vertex and w.r.t Cross axis
    //                           /             \                  In SlopeAngle Function
    //                         /________\

    canvas.drawLine(Offset(p0[0], p0[1]), Offset(p1[0], p1[1]), paint);
    canvas.drawLine(Offset(p0[0], p0[1]), Offset(p2[0], p2[1]), paint);
    canvas.drawLine(Offset(p2[0], p2[1]), Offset(p1[0], p1[1]), paint);
    // Lines Joining the three points
  }

  void drawHead() {
    int len = points.length;
    int x1 = points[len - 1] == Offset.infinite ? len - 2 : len - 1;
    drawTriangle(
        points[x1].dx,
        points[x1].dy,
        10,
        slopeAngle(points[x1].dx, points[x1].dy, points[x1 - 3].dx,
            points[x1 - 3].dy));
    // The last 2 points are very close hence does not give a general idea of the direction
  }
}
