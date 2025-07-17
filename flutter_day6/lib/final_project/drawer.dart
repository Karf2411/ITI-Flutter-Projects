import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          TweenAnimationBuilder(
            duration: const Duration(seconds: 1),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.scale(
                  scale: value,
                  child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(color: Colors.blue),
                    accountName: const Text("Abdullah Samir"),
                    accountEmail: const Text("abdullah@gmail.com"),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/user.jpg"),
                    ),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Profile")));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Settings")));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Logout")));
            },
          ),
          const Spacer(),
          SwitchListTile(
            title: const Text("Dark Mode"),
            secondary: const Icon(Icons.dark_mode),
            value: false,
            onChanged: (val) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Dark Mode")));
            },
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
