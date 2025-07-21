import 'package:flutter/material.dart';
import 'package:manage_tasks/Core/utils/assets.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Image.asset(Assets.splash, fit: BoxFit.cover),
      ),
    );
  }
}
