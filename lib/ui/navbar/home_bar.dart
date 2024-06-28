
import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget {

  static const routeName = '/home';

  const HomeBar({Key? key}) : super(key: key);

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  @override
  Widget build(BuildContext context) {
    return Container(); // Add a return statement to fix the error
  }
  
  }