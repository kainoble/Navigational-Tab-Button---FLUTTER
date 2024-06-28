
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {

  static const routeName = '/search';

  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(); // Add a return statement to fix the error
  }
  
  }