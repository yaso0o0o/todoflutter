import 'package:flutter/material.dart';
import 'package:flutter_application_1/news_app/core/theme/app_theme.dart';
import 'package:flutter_application_1/news_app/view/screens/business_news_screen.dart';
import 'package:flutter_application_1/news_app/view/screens/general_news_screen.dart';
import 'package:flutter_application_1/news_app/view/screens/technology_news_screen.dart';
import 'package:flutter_application_1/news_app/view/screens/switch_button.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key, required this.onThemeChanged});

  final ValueChanged<bool> onThemeChanged;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentScreenItem = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      GeneralNewsScreen(),
      BusinessNewsScreen(),
      TechnologyNewsScreen(),
    ];
  }

  void _onTapped(int index) {
    setState(() {
      currentScreenItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        actions: [
          SwitchButton(onThemeChanged: widget.onThemeChanged),
        ],
      ),
      body: screens[currentScreenItem],
      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentScreenItem,
        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'General',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Technology',
          ),
        ],
        onTap: _onTapped,
      ),
    );
  }
}