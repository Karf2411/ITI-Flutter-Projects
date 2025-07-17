import 'package:flutter/material.dart';

class SlideInFeatureBox extends StatelessWidget {
  const SlideInFeatureBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slide-in Feature Box')),
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          curve: Curves.easeOutBack,
          tween: Tween<double>(begin: 40.0, end: 0.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, value),
              child: Opacity(
                opacity: (1 - (value / 40)).clamp(0.0, 1.0),
                child: child,
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "flutter",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "build cross platform apps",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
