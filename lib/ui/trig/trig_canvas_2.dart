import 'package:flutter/material.dart';
import 'package:flutter_math/ui/shared/size_config.dart';
import 'package:flutter_math/ui/trig/trig_paint_3.dart';
import 'package:flutter_math/ui/trig/trig_paint_circles.dart';
import '../../extensions/size_extension.dart';
import 'dart:math' as math;

class TrigCanvas2 extends StatefulWidget {
  @override
  _TrigCanvas2State createState() => _TrigCanvas2State();
}

class _TrigCanvas2State extends State<TrigCanvas2>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Tween tween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 0.0, end: math.pi * 2).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 10.height,
      width: 10.width,
      color: Colors.white,
      child: CustomPaint(
        painter: TrigPaintCircle(animation.value),
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

    canvas.translate(0, height / 2);
    // canvas.scale(0.3);

    // for (var i = 0; i < 100; i++) {
    //   var rand = math.Random();

    //   path1.moveTo((rand.nextDouble() * width), (rand.nextDouble() * height));
    //   path1.lineTo((rand.nextDouble() * width), (rand.nextDouble() * height));
    //   path1.close();
    // }

    //draw a simple sine wave
    for (double angle = 0; angle < math.pi * 2; angle += .01) {
      print(math.sin(angle));

      var x = angle * 50;
      var y = math.sin(angle) * 50;

      Rect rect = Rect.fromLTWH(x, y, 2, 2);

      path1.addRect(rect);
    }

    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
