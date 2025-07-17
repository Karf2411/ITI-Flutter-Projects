import 'package:flutter/material.dart';

class AnimatedDrawerHeader extends StatelessWidget {
  const AnimatedDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animated Drawer Header',
          style: TextStyle(fontSize: 20, color: Colors.blue[700]),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 1),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: Transform.scale(
                      scale: value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/images/user.jpg',
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Abdullah Samir',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "tap menu to open drawer",
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
    );
  }
}
