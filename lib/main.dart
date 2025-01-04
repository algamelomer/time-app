// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Timer_date(),
    );
  }
}

class Timer_date extends StatefulWidget {
  const Timer_date({super.key});
  @override
  State<Timer_date> createState() => _Timer_dateState();
}

class _Timer_dateState extends State<Timer_date> {
  String year = "";
  String day = "";
  String month = "";
  String dayOfWeek = "";
  String hour = "";
  String min = "";
  String sec = "";

  changeEverySec() {
    Timer.periodic(Duration(seconds: 1), (Timer) {
      // print();
      setState(() {
        DateTime now = DateTime.now();
        year = now.year.toString();
        day = now.day.toString();
        month = getMonth(now).toString();
        hour = now.hour.toString();
        min = now.minute.toString();
        sec = now.second.toString();
        dayOfWeek = getDayOfWeek(now).toString();
      });
    });
  }

  String getDayOfWeek(DateTime date) {
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[date.weekday - 1];
  }

  String getMonth(DateTime date) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[date.month - 1];
  }

  String qqq = "";

  calledOnlyOneTime() {
    Timer(Duration(seconds: 10), () {
      setState(() {
        qqq = "Hello there!";
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();
    calledOnlyOneTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Time & Date App",
            style: TextStyle(fontSize: 27, color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 57, 73, 80),
        ),
        backgroundColor: Color.fromARGB(255, 33, 40, 43),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Today's Date is $dayOfWeek",
                style: TextStyle(color: Colors.white, fontSize: 27),
              ),
              SizedBox(
                height: 22,
              ),
              Text("$month $day, $year",
                  style: TextStyle(color: Colors.white, fontSize: 27)),
              SizedBox(
                height: 22,
              ),
              Text("$hour : $min : $sec",
                  style: TextStyle(color: Colors.white, fontSize: 27)),
              SizedBox(
                height: 27,
              ),
              Text(
                "$qqq",
                style: TextStyle(color: Colors.white, fontSize: 27),
              )
            ],
          ),
        ));
  }
}
