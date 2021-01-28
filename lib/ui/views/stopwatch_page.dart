import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/export.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  bool startStop = true;

  bool reset = true;
  String stopDispTime = '00:00:00';
  var stopwatch = Stopwatch();

  final duration = const Duration(milliseconds: 1);

  void startTimer() {
    Timer(duration, continueToRun);
  }

  void continueToRun() {
    if (stopwatch.isRunning) {
      startTimer();
    }
    setState(() {
      // If string is less than 2 add 0
      stopDispTime =
          (stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
              ':' +
              (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
              ':' +
              (stopwatch.elapsed.inMilliseconds / 10 % 100)
                  .truncate()
                  .toString()
                  .padLeft(2, '0');
    });
  }

  void startStopStopWatch() {
    if (startStop) {
      startStopwatch();
    } else {
      stopStopWatch();
    }
  }

  void startStopwatch() {
    setState(() {
      startStop = false;
    });
    stopwatch.start();
    startTimer();
  }

  void stopStopWatch() {
    setState(() {
      startStop = true;
      reset = false;
    });
    stopwatch.stop();
  }

  void resetStopWatch() {
    setState(() {
      reset = true;
      stopDispTime = '00:00:00';
    });
    stopwatch.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Stopwatch',
            style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: CustomColors.primaryTextColor,
                fontSize: 24),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stopDispTime,
                  style: TextStyle(fontSize: 70, color: Colors.white),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      onPressed: () => startStopStopWatch(),
                      color: CustomColors.minHandEndColor,
                      child: Text(
                        'START',
                        style: TextStyle(fontSize: 20, fontFamily: 'avenir'),
                      ),
                    ),
                    SizedBox(width: 40),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      onPressed: startStop ? resetStopWatch : null,
                      color: CustomColors.hourHandStatColor,
                      child: Text(
                        'RESET',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'avenir'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}