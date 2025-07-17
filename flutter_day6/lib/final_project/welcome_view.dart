import 'package:flutter/material.dart';
import 'package:flutter_day6/final_project/profile_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                tween: Tween<Offset>(
                  begin: const Offset(0, 100),
                  end: Offset.zero,
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutBack,
                child: const Icon(
                  Icons.app_registration,
                  size: 100,
                  color: Colors.blue,
                ),
                builder: (context, value, child) {
                  return Transform.translate(offset: value, child: child);
                },
              ),
              const SizedBox(height: 20),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                child: const Text(
                  'Welcome to Our App',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(scale: value, child: child),
                  );
                },
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 3),
                child: const Text(
                  'Let\'s get started!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(scale: value, child: child),
                  );
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileView()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
