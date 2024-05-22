import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    switch (location) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
    }
    return 0;
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/');
        break;
      case 2:
        context.go('/favorites');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        onTap: (value) => onItemTapped(context, value),
        currentIndex: getCurrentIndex(context),
        items: const [
          BottomNavigationBarItem(label: 'Inicio', icon: Icon(Icons.home_max)),
          BottomNavigationBarItem(
              label: 'Categorías', icon: Icon(Icons.label_outline)),
          BottomNavigationBarItem(
              label: 'Favoritos', icon: Icon(Icons.favorite_outline))
        ]);
  }
}
