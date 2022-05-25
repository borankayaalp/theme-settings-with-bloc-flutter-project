import 'package:flutter/material.dart';
import 'package:theme_bloc/presentation/screens/home_screen.dart';
import 'package:theme_bloc/presentation/screens/settings_screen.dart';
import 'package:theme_bloc/presentation/widgets/botnavbar_widget.dart';
import 'package:theme_bloc/presentation/widgets/brightness_listtile_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme App - Appbar'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: BrighnessListTileWidget(
                  title: 'Brightness',
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView(
            controller: pageController,
            children: const [
              HomeScreen(),
              SettingsScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
