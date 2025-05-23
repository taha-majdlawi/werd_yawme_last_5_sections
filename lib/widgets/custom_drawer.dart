import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/screens/change_font_size_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const CustomDrawer({super.key, required this.isDarkMode, required this.onThemeChanged});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          isDarkMode ? Color(0xff1C1C22) : Color.fromARGB(255, 227, 226, 234),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 196, 185, 153),
            ),
            child: Text(
              'الإعدادات',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Amiri',
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.font_download),
            title: Text(
              textAlign: TextAlign.center,
              'تغيير حجم الخط',
              style: TextStyle(fontFamily: 'Amiri', fontSize: 20),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FontSizeSettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              textAlign: TextAlign.center,
              'تبديل الوضع',
              style: TextStyle(fontFamily: 'Amiri', fontSize: 20),
            ),
            leading: Switch(
              activeColor: Color.fromARGB(255, 196, 185, 153),
              value: isDarkMode,
              onChanged: onThemeChanged, // تغيير الثيم عند التبديل
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text(
              textAlign: TextAlign.center,
              'التواصل مع المطور',
              style: TextStyle(fontFamily: 'Amiri', fontSize: 20),
            ),
            onTap: () async {
              String url = "https://wa.me/972592345890";
              Uri uri = Uri.parse(url);

              await launchUrl(uri);
            },
          ),
        ],
      ),
    );
  }
}
