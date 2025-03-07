import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/screens/change_font_size_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 226, 234),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "الورد اليومي",
          style: TextStyle(fontFamily: 'Amiri', fontSize: 25),
        ),
        backgroundColor: Color.fromARGB(255, 227, 226, 234),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 196, 185, 153),
                ),
                child: Text(
                  'الإعدادات',
                  style: TextStyle(fontSize: 24, fontFamily: 'Amiri'),
                ),
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
            ListTile(),
          ],
        ),
      ),
    );
  }
}
