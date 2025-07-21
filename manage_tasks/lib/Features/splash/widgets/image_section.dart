import 'package:flutter/material.dart';
import 'package:manage_tasks/Core/utils/assets.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(Assets.splash, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
