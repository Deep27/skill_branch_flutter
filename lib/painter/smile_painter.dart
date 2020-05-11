import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final facePaint = Paint()..color = Colors.green;

    final eyePaint = Paint()..color = Colors.black;

    final mouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(center, radius, facePaint);
    canvas.drawCircle(
        Offset(center.dx - radius / 3, center.dy - radius / 3), 20, eyePaint);
    canvas.drawCircle(
        Offset(center.dx + radius / 3, center.dy - radius / 3), 20, eyePaint);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(center.dx, center.dy + radius / 4),
            radius: radius / 3),
        math.pi / 6,
        math.pi * 0.5,
        false,
        mouthPaint);

//    final p1 = Offset(50, 50);
//    final p2 = Offset(100, 150);
//    canvas.drawLine(p1, p2, paint);
//    canvas.drawRect(Rect.fromLTRB(0, 10, 52, 52), paint);
//    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
