import 'package:flutter/material.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';
import '../../constants/theme_data.dart';
import '../timer_toast.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int hour = 0;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timeToDisplay = '';
  bool checkTimer = true;

  void start() {
    setState(() {
      started = false;
      stopped = false;
    });
    timeForTimer = ((hour * 60 * 60) + (min * 60) + sec);
    debugPrint(timeForTimer.toString());
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timeForTimer < 1 || checkTimer == false) {
          t.cancel();
          checkTimer = true;
          timeToDisplay = '0:0:0';
          if (timeForTimer == 0) {
            debugPrint('Stopped by default');
            timerToast(context);
            started = true;
            stopped = true;
          }
        } else if (timeForTimer < 60) {
          timeToDisplay = timeForTimer.toString();
          timeForTimer = timeForTimer - 1;
        } else if (timeForTimer < 3600) {
          int m = timeForTimer ~/ 60;
          int s = timeForTimer - (60 * m);
          timeToDisplay = m.toString() + ':' + s.toString();
          timeForTimer = timeForTimer - 1;
        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          timeToDisplay =
              h.toString() + ':' + m.toString() + ':' + s.toString();
          timeForTimer = timeForTimer - 1;
        }
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stopped = true;
      checkTimer = false;
      timerToast(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Timer',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor,
                  fontSize: 24),
            ),
          ),
          Expanded(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'HOUR',
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 24),
                        ),
                      ),
                      NumberPicker.integer(
                          highlightSelectedValue: true,
                          selectedTextStyle:
                              TextStyle(color: Colors.white, fontSize: 36),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 36),
                          initialValue: hour,
                          minValue: 0,
                          maxValue: 23,
                          onChanged: (val) {
                            setState(() {
                              hour = val;
                            });
                          })
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'MINS',
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 24),
                        ),
                      ),
                      NumberPicker.integer(
                          highlightSelectedValue: true,
                          selectedTextStyle:
                              TextStyle(color: Colors.white, fontSize: 36),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 36),
                          initialValue: min,
                          minValue: 0,
                          maxValue: 23,
                          onChanged: (val) {
                            setState(() {
                              min = val;
                            });
                          })
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'SECS',
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 24),
                        ),
                      ),
                      NumberPicker.integer(
                          highlightSelectedValue: true,
                          selectedTextStyle:
                              TextStyle(color: Colors.white, fontSize: 36),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 36),
                          initialValue: sec,
                          minValue: 0,
                          maxValue: 23,
                          onChanged: (val) {
                            setState(() {
                              sec = val;
                            });
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  timeToDisplay,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'avenir',
                      fontSize: 60,
                      fontWeight: FontWeight.w700),
                ),
              )),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: CustomColors.minHandEndColor,
                  onPressed: started ? start : null,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    'START',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(width: 40),
                RaisedButton(
                  color: CustomColors.hourHandStatColor,
                  onPressed: stopped ? null : stop,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    'STOP',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}