import 'package:flutter/material.dart';

import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerApp(),
    );
  }
}

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  bool isStop = true;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  Timer timer;

  void changeTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (isStop) timer.cancel();
      setState(() {
        seconds++;
        if (seconds == 60) {
          seconds = 0;
          minutes++;
        }
        if(minutes == 60){
          minutes = 0;
          hours++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            minWidth: double.infinity),
        color: Color(0xffeb4d4b),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage('images/up.png'),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'HOUR',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xffF3F6E6),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 300,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xffF3F6E6),
                            ),
                            child: Text(
                              hours.toString(),
                              style: TextStyle(
                                fontSize: 90,
                                color: Color(0xffEB4D4B),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'MINUTE',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xffF3F6E6),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xffF3F6E6),
                            ),
                            height: 300,
                            width: 130,
                            child: Text(
                              minutes.toString(),
                              style: TextStyle(
                                fontSize: 90,
                                color: Color(0xffEB4D4B),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'SECOND',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xffF3F6E6),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xffF3F6E6),
                            ),
                            alignment: Alignment.center,
                            height: 300,
                            width: 130,
                            child: Text(
                              seconds.toString(),
                              style: TextStyle(
                                fontSize: 90,
                                color: Color(0xffEB4D4B),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/down.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              isStop = false;
                              isStop = false;
                              changeTime();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 110,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xff383A48),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'START',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffF3F6E6),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              isStop = true;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 110,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xff383A48),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'PAUSE',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffF3F6E6),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              isStop = true;
                              setState(() {
                                seconds = 0;
                                hours = 0;
                                minutes = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff383A48),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              width: 110,
                              height: 35,
                              child: Text(
                                'RESET',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffF3F6E6),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
