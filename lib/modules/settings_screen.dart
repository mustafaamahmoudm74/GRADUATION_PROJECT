import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _privacy = false;
  bool _notifications = false;
  bool _language = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchListTile('Privacy', _privacy, (value) {
              setState(() {
                _privacy = value;
              });
            }),
            _buildSwitchListTile('Notifications', _notifications, (value) {
              setState(() {
                _notifications = value;
              });
            }),
            _buildSwitchListTile('Language', _language, (value) {
              setState(() {
                _language = value;
              });
            }),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle save action
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchListTile(
      String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
