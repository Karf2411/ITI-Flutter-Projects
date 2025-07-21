import 'package:flutter/material.dart';
import 'package:manage_tasks/Features/splash/widgets/image_section.dart';
import 'package:manage_tasks/Features/splash/widgets/welcome&button_section.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1C24),
      body: Column(children: [ImageSection(), WelcomeAndButtonSection()]),
    );
  }
}
