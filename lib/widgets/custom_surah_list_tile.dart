import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';
import 'package:lastfivesectionsofquran/screens/show_all_werds_for_surah.dart';

class CustomSurahListTile extends StatelessWidget {
  const CustomSurahListTile({super.key, required this.surah, required this.isDarkmode});
  final Surah surah;
  final bool isDarkmode;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ShowAllWerdsForSurah(surah: surah,isDarkMode: isDarkmode,);
            },
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
        elevation: 1,
        child: ListTile(
          leading: Text(
            textAlign: TextAlign.right,
            surah.surahNumber.toString(),
            style: TextStyle(fontSize: 20, fontFamily: 'Amiri'),
          ),
          title: Text(
            textAlign: TextAlign.right,
            surah.surahName,
            style: TextStyle(fontFamily: 'Amiri'),
          ),
        ),
      ),
    );
  }
}
