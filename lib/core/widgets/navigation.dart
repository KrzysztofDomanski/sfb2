import 'package:flutter/material.dart';
import 'package:sfb/core/routing/nav_extension.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    required this.child,
    required this.title,
    required this.selectedIndex,
    super.key,
  });

  final Widget child;
  final String title;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: size.width > 600
          ? null
          : NavigationBar(
              selectedIndex: selectedIndex,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              onDestinationSelected: (value) =>
                  _onDestinationSelected(value, context),
            ),
      body: SafeArea(
        child: size.width > 600
            ? Row(
                children: [
                  NavigationRail(
                    scrollable: true,
                    extended: size.width > 800,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person),
                        label: Text('Profile'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) =>
                        _onDestinationSelected(value, context),
                  ),
                  Expanded(child: child),
                ],
              )
            : child,
      ),
    );
  }

  void _onDestinationSelected(int value, BuildContext context) {
    if (value == 0) {
      context.goToHome();
    } else if (value == 1) {
      context.goToProfile();
    }
  }
}
