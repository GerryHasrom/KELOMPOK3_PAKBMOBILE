import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Text(
          'Settings Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
