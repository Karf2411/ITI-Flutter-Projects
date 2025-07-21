import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manage_tasks/Core/widgets/custom_button.dart';

class WelcomeAndButtonSection extends StatelessWidget {
  const WelcomeAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Welcome to TaskMate',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Let\'s organize your day!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                onPressed: () {
                  context.go('/create-account');
                },
                text: 'Get Started',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
