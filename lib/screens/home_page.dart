import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/screens/change_font_size_screen.dart';
import 'package:lastfivesectionsofquran/widgets/custom_drawer.dart';
import 'package:lastfivesectionsofquran/widgets/custom_surah_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<double> onFontSizeChanged;

  HomePage({
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.onFontSizeChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode ? Colors.black : Color.fromARGB(255, 227, 226, 234),
      appBar: AppBar(
        backgroundColor:
            isDarkMode ? Colors.black : Color.fromARGB(255, 227, 226, 234),

        centerTitle: true,
        title: const Text(
          "الورد اليومي",
          style: TextStyle(fontFamily: 'Amiri', fontSize: 25),
        ),
      ),
      drawer: CustomDrawer(
        isDarkMode: isDarkMode,
        onThemeChanged: onThemeChanged,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CustomSurahListTile();
        },
      ),
    );
  }
}
