import 'package:flutter/material.dart';
import 'dart:math' as math;

class TrigPaintCircle extends CustomPainter {
  double angle;

  TrigPaintCircle(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = Colors.blue;

    final path1 = Path();

    double height = size.height;
    double width = size.width;

    double centerY = height * 0.5;
    double centerX = width * 0.4;
    double offsetY = height * 0.4;
    double radius = 150;

    // double speed = 0.1;
    // double angle = 0;

    var y = centerY + math.sin(angle * 3) * radius;
    var x = centerX + math.cos(angle * 2) * radius;
    Rect rect = Rect.fromLTWH(x, y, width / 4, height / 8);
    canvas.drawArc(rect, 0, math.pi * 2, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
