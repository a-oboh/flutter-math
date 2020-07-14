import 'package:flutter/material.dart';
import 'package:flutter_math/ui/shared/size_config.dart';
import '../../extensions/size_extension.dart';
import 'dart:math' as math;

class TrigCanvas extends StatefulWidget {
  @override
  _TrigCanvasState createState() => _TrigCanvasState();
}

class _TrigCanvasState extends State<TrigCanvas> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 100.height,
      width: 100.width,
      color: Colors.white,
      child: CustomPaint(
        painter: TrigPainter(),
      ),
    );
  }
}

class TrigPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.blue;

    double height = size.height;
    double width = size.width;

    final path1 = Path();

    for (var i = 0; i < 100; i++) {
      var rand = math.Random();

      path1.moveTo((rand.nextDouble() * width), (rand.nextDouble() * height));
      path1.lineTo((rand.nextDouble() * width), (rand.nextDouble() * height));
      path1.close();
    }

    // canvas.drawRect(
    //   Rect.fromLTWH(20, 40, 100, 100),
    //   paint,
    // );
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
