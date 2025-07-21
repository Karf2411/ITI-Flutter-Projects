import 'package:flutter/material.dart';
import 'package:manage_tasks/Core/utils/cash_helper.dart';
import 'package:manage_tasks/Features/taps/widgets/home_imagesection.dart';
import 'package:manage_tasks/Features/taps/widgets/home_welcomesection.dart';

import '../widgets/home_headersection.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  _loadUserName() async {
    String firstName = await CacheHelper.getData(key: 'firstName');
    String lastName = await CacheHelper.getData(key: 'lastName');
    setState(() {
      userName = '$firstName $lastName';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a2332),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(userName: userName),
              ImageSection(),

              const SizedBox(height: 30),

              WelcomeSection(),
            ],
          ),
        ),
      ),
    );
  }
}
