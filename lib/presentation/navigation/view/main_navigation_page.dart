import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_navigation_bar.dart'; 

/// {@template main_navigation_page}
/// Main page that contains the bottom navigation and handles navigation between
/// the three main screens: Home, Watch History, and Profile
/// {@endtemplate}
class MainNavigationPage extends StatefulWidget {
  /// {@macro main_navigation_page}
  const MainNavigationPage({
    super.key,
    required this.child,
    required this.location,
  });

  /// The child widget to display (current route content)
  final Widget child;

  /// The current route location
  final String location;

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _updateCurrentIndex();
  }

  @override
  void didUpdateWidget(MainNavigationPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      _updateCurrentIndex();
    }
  }

  void _updateCurrentIndex() {
    final location = widget.location;
    if (location.startsWith('/home')) {
      _currentIndex = 0;
    } else if (location.startsWith('/history')) {
      _currentIndex = 1;
    } else if (location.startsWith('/profile')) {
      _currentIndex = 2;
    }
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/history');
        break;
      case 2:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
