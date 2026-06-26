import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';
import '../providers/theme_provider.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigationProvider>();

    final List<Widget> screens = const [
      AddSubjectScreen(),
      SubjectListScreen(),
      SummaryScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Grade Tracker'),
        actions: [
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),

      body: screens[navigationProvider.currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.currentIndex,
        onTap: (index) {
          context.read<NavigationProvider>().changeIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Subjects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Summary',
          ),
        ],
      ),
    );
  }
}