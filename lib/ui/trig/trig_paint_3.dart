import 'package:flutter/material.dart';
import 'dart:math' as math;

class TrigPainter3 extends CustomPainter {
  double angle;

  TrigPainter3(this.angle);

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
    double centerX = width * 0.5;
    double offsetY = height * 0.4;
    // double speed = 0.1;
    // double angle = 0;

    render() {
      var y = centerY + math.sin(angle) * offsetY;

      Rect rect = Rect.fromLTWH(centerX, y, 30, 0);
      canvas.drawArc(rect, 0, math.pi * 2, false, paint);
      // path1.fillType = PathFillType.evenOdd;
      // path1.arcTo(rect, 0, math.pi * 2, false);

      // angle += speed;
    }

    var y = centerY + math.sin(angle) * offsetY;
    Rect rect = Rect.fromLTWH(centerX, y, width / 4, height / 8);
    canvas.drawArc(rect, 0, math.pi * 2, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
