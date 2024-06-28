import 'package:dafaget_app/ui/tabbar/period_bar.dart';
import 'package:dafaget_app/ui/tabbar/sign_bar.dart';
import 'package:dafaget_app/ui/tabbar/types_bar.dart';
import 'package:dafaget_app/ui/navbar/setting_screen.dart';
import 'package:dafaget_app/ui/navbar/home_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.index}) : super(key: key);

  final int? index;

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = const [
    Tab(text: 'Sign'),
    Tab(text: 'Period'),
    Tab(text: 'Types'),
  ];

  final List<Widget> _tabScreens = const [
    SignBar(),
    PeriodBar(),
    TypesBar(),
  ];

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
    NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  final List<Widget> _navScreens = const [
    HomeBar(),
    SearchBar(),
    SettingBar(),
  ];

  int _currentNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);

    if (widget.index != null) {
      _tabController.index = widget.index!;
    }

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() async {
    if (_currentNavIndex != 0) {
      setState(() {
        _currentNavIndex = 0;
      });
      return false;
    } else if (_tabController.index != 0) {
      _tabController.animateTo(0);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My App'),

          bottom: _currentNavIndex == 0
              ? TabBar(
                  controller: _tabController,
                  tabs: _tabs,
                )
              : null,
        ),
        body: _currentNavIndex == 0
            ? TabBarView(
                controller: _tabController,
                children: _tabScreens,
              )
            : _navScreens[_currentNavIndex],
        bottomNavigationBar: NavigationBar(
          elevation: 12,
          destinations: _destinations,
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          selectedIndex: _currentNavIndex,
          onDestinationSelected: (value) {
            setState(() {
              _currentNavIndex = value;
            });
          },
        ),
      ),
    );
  }
}
