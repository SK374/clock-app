import 'package:flutter/material.dart';
import '../constants/theme_data.dart';

void timerToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text(
        'YOUR TIMER HAS ENDED.',
        style:
            TextStyle(fontFamily: 'avenir', fontSize: 18, color: Colors.black),
      ),
      backgroundColor: CustomColors.secHandColor,
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'OK',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ),
  );
}