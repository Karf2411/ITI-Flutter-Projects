import 'package:flutter/material.dart';

class AnimatedWelcome extends StatelessWidget {
  const AnimatedWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Animated Welcome Text
              TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 1000),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(
                      scale: 0.8 + (0.2 * value),
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 20),

              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 1000),
                curve: Interval(0.5, 1.0),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1 - value) * 20),
                      child: Text(
                        "Let's get started!",
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
