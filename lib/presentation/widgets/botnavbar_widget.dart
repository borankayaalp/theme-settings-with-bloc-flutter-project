import 'package:flutter/material.dart';
import 'package:theme_bloc/presentation/screens/main_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int activeIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      MainScreen.pageController.previousPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    } else if (index == 1) {
      MainScreen.pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    setState(() {
      activeIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    MainScreen.pageController.addListener(() {
      setState(() {
        activeIndex = MainScreen.pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.25),
      currentIndex: activeIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
