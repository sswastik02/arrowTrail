import 'dart:math';

List<double> rotateByAngle(
    double x, double y, double x0, double y0, double angle) {
  // rotates clockwise
  double s = sin(angle);
  double c = cos(angle);

  // translate point back to origin:
  x -= x0;
  y -= y0;

  // rotate point
  double xnew = x * c - y * s;
  double ynew = x * s + y * c;

  // translate point back:
  x = xnew + x0;
  y = ynew + y0;

  return [x, y];
}

double slopeAngle(double x1, double y1, double x2, double y2) {
  // calculates slope w.r.t cross axis
  if (y1 == y2) {
    if (x1 > x2) {
      return (-3.1416 / 2);
    }
    return (3.1416 / 2);
  }
  if (x1 == x2) {
    if (y1 > y2) {
      return 0;
    }
    return 3.1416;
  }
  // tan inverse always returns 2 values but dart returns 1 So it needs to be handled for both conditions
  double m = -1 * (y2 - y1) / (x2 - x1);
  print([x1, y1, x2, y2]);
  if (y1 < y2) {
    return (3.1416) + atan(1 / m);
  }
  return atan(1 / m);
}
