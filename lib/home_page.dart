import 'package:flutter/material.dart';
import './constants/export.dart';
import './ui/views/export.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: softBlack,
        child: ClockView(),
      ),
    );
  }
}