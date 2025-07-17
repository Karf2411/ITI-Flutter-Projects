import 'package:flutter/material.dart';
import 'package:flutter_day6/final_project/welcome_view.dart';
import 'package:flutter_day6/task1.dart';
import 'package:flutter_day6/task2.dart';
import 'package:flutter_day6/task3.dart';
import 'package:flutter_day6/task4.dart';
import 'package:flutter_day6/task5.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: FlutterDay6()));

class FlutterDay6 extends StatelessWidget {
  const FlutterDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return animatedDrawerHeader;
  }
}

//task1
AnimatedWelcome animatedWelcome = AnimatedWelcome();

//task2
StackedCard stackedCard = StackedCard();

//task3
SlideInFeatureBox slideInFeatureBox = SlideInFeatureBox();

//task4
ProfileLayout profileLayout = ProfileLayout();

//task5
AnimatedDrawerHeader animatedDrawerHeader = AnimatedDrawerHeader();

//final project
WelcomeScreen welcomeScreen = WelcomeScreen();
