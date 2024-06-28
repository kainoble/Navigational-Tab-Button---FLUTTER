import 'package:dafaget_app/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcceptContinue extends StatefulWidget {
  @override
  _AcceptContinueState createState() => _AcceptContinueState();
}

class _AcceptContinueState extends State<AcceptContinue> {

  @override
  void initState() {
    super.initState();
    _checkIfMessageShown();
  }

  Future<void> _checkIfMessageShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool messageShown = prefs.getBool('messageShown') ?? false;
    setState(() {
    });
    if (!messageShown) {
      await prefs.setBool('messageShown', true);
      // Navigate to HomeScreen after setting messageShown flag
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Terms and Conditions',
      home: HomeScreen(),
    );
  }
}
