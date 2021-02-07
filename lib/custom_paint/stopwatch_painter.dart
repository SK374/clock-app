import 'dart:math';
import 'package:flutter/material.dart';
import '.././constants/theme_data.dart';

class StopwatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = CustomColors.clockBG;
    var outlineBrush = Paint()
      ..color = CustomColors.clockOutline
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    var centerDotBrush = Paint()..color = CustomColors.clockOutline;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [
        CustomColors.minHandStatColor,
        CustomColors.minHandEndColor
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var line = Paint()
      ..color = CustomColors.clockOutline
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    canvas.drawLine(Offset(115, 10), Offset(155, 10), line);
    canvas.drawLine(Offset(150, 120), Offset(50, 50), line);
    canvas.drawLine(Offset(220, 50), Offset(170, 80), line);

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    var minHandX = centerX + radius * 0.6 * cos(269 * pi / 180);
    var minHandY = centerY + radius * 0.6 * sin(269 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    canvas.drawCircle(center, radius * 0.12, centerDotBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}