import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1F78C1), Color(0xFF3FA9F5)],
              ),
            ),
            accountName: const Text(
              'KUMAR KUMAR',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text('utkarsh@mobriz.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 32),
            ),
          ),

          _drawerItem(Icons.edit, 'Edit Profile', () {}),
          _drawerItem(Icons.share, 'Tell a Friend', () {}),
          _drawerItem(Icons.help_outline, 'Q&A', () {}),
          _drawerItem(Icons.description, 'Terms & Conditions', () {}),
          _drawerItem(Icons.contact_mail, 'Contact', () {}),

          const Spacer(),
          const Divider(),

          _drawerItem(Icons.logout, 'Logout', () {
            // Get.offAllNamed('/login');
          }),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
