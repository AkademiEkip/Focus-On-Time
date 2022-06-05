import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_akademi/timer_buttonwidget.dart';

class TimerPage extends StatefulWidget {
  TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

enum TimerState { practice, practiceBreak }

class _TimerPageState extends State<TimerPage> {
  late int _seconds;
  late int _minutes;
  var f = NumberFormat("00");
  var timerState = TimerState.practice;

  Timer? _timer;
  void resetTimer() => setState(() {
        if (timerState == TimerState.practice) {
          _seconds = 00;
          _minutes = 25;
        } else {
          _seconds = 00;
          _minutes = 5;
        }
      });

  void startTimer() {
    if (_seconds > 60) {
      _minutes = (_seconds / 60).floor();
      _seconds -= (_minutes * 60);
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _seconds = 59;
            _minutes--;
          }
        }
        if (_seconds == 0 && _minutes == 0) {
          if (timerState == TimerState.practiceBreak) {
            timerState = TimerState.practice;
          } else {
            timerState = TimerState.practiceBreak;
          }
          resetTimer();
          _timer!.cancel();
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      _timer?.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  @override
  void dispose() {
    Timer? _timer;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Pomodoro Sayacı")
         ),
        body: Container(
            decoration: methodPageBackground(),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${f.format(_minutes)}: ${f.format(_seconds)} ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 150,
                ),
                _buildButtons()
              ],
            ))));
  }

  BoxDecoration methodPageBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color.fromARGB(255, 4, 108, 212),
        (Color.fromARGB(255, 208, 221, 235))
      ], begin: FractionalOffset(0.5, 1)),
    );
  }

  _buildButtons() {
    final isRunning = _timer == null ? false : _timer!.isActive;

    return isRunning
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                text: isRunning ? 'Durdur' : 'Devam Et',
                onClicked: () {
                  if (isRunning) {
                    stopTimer();
                  } else {
                    startTimer();
                  }
                },
              ),
              const SizedBox(width: 20),
              ButtonWidget(
                text: 'Sıfırla',
                onClicked: () {
                  stopTimer();
                  resetTimer();
                },
              ),
            ],
          )
        : ButtonWidget(
            text: timerState == TimerState.practiceBreak
                ? 'Molayı Başlat'
                : 'Çalışmayı Başlat',
            onClicked: () {
              startTimer();
            });
  }
}
