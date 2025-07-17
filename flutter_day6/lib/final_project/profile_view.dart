import 'package:flutter/material.dart';
import 'package:flutter_day6/final_project/drawer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: const Text('Profile View')),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.lightBlueAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Text(
                  'Your Profile Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'Abdullah Samir Hussein',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Mobile App Developer',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'abdullah@gmail.com',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Text('Open Drawer'),
            ),
          ),
        ],
      ),
    );
  }
}
