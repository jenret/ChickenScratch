import 'package:flutter/material.dart';
import 'allViews.dart';

class HamburgerBarMenuView extends StatelessWidget {
  const HamburgerBarMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
            child: Text('Display Name'),
          ),
          ListTile(
            title: const Text('Topics'),
            onTap: () {
              print('go to topics');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              print('go to user profile');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              print('go to settings');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => LoginView()), (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            title: const Text('New Note'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateNoteView())
              );
            },
          )
        ],
      ),
    );
  }
}
