import 'package:flutter/material.dart';

class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  TooltipShapeBorder({
    this.radius = 16.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(
        rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    // double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.centerLeft.dx, rect.centerLeft.dy - 4.5)
      ..relativeLineTo(-7.5, 5)
      ..relativeLineTo(7.5, 5);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

// Container(
//         decoration: ShapeDecoration(
//           color: Colors.red,
//           shape: TooltipShapeBorder(arrowArc: 0.5),
//           shadows: [
//             BoxShadow(
//                 color: Colors.black26, blurRadius: 4.0, offset: Offset(2, 2))
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text('Text 22', style: TextStyle(color: Colors.white)),
//         ),
//       ),
