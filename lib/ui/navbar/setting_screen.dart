import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingBar extends StatefulWidget {
  static const routeName = '/setting';

  const SettingBar({Key? key}) : super(key: key);

  @override
  State<SettingBar> createState() => _SettingBarState();
}

class _SettingBarState extends State<SettingBar> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero, // Set padding to zero
        children: [
          ListTile(
            title: const Text('Themes'),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                  // Add logic to switch theme mode
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Ratings'),
            onTap: () {
              // Add action to navigate or open Play Store link for ratings
            },
          ),
          ListTile(
            title: const Text('Terms and Conditions'),
            onTap: () {
              _launchURL(
                  'https://www.example.com/terms'); // Replace URL with your terms and conditions URL
            },
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
