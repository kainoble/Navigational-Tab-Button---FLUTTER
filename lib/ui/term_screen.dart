import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dafaget_app/ui/home_screen.dart';
import 'package:url_launcher/url_launcher.dart'; // Import HomeScreen

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  void initState() {
    super.initState();
    _checkIfTermsShown();
  }

  Future<void> _checkIfTermsShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool termsShown = prefs.getBool('termsShown') ?? false;
    if (!termsShown) {
      // Show the terms for the first time
      await showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'By using our services, you agree to our Privacy Policy. Please review our policy to understand how we collect, use, and protect your information.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16.0),
                ),
                GestureDetector(
                  onTap: () {
                    _openLink(
                        'https://www.freeprivacypolicy.com/live/75d04e98-11f5-4045-989a-d0991b20e50f');
                  },
                  child: const Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          actions: [
            Center(
            child: ElevatedButton(
              onPressed: () {
                // Set termsShown flag and navigate to HomeScreen
                prefs.setBool('termsShown', true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Accept and Continue'),
            ),
          ),
        ],

            
          );
        },
      );
    } else {
      // Terms already shown, navigate to HomeScreen
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  void _openLink(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const Center(
        child: CircularProgressIndicator(), // Show a loader while checking terms
      ),
    );
  }
}
