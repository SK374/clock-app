import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../custom_paint/clock_painter.dart';

class ClockView extends StatefulWidget {
  final double size;

  const ClockView({Key key, this.size}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: widget.size,
        height: widget.size,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}