import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';

class CustomSurahListTile extends StatelessWidget {
  const CustomSurahListTile({super.key, required this.surah});
  final Surah surah;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
      elevation: 5,
      child: ListTile(
        leading: Text(
          textAlign: TextAlign.right,
          surah.surahNumber.toString(),
          style: TextStyle(fontSize: 20),
        ),
        title: Text(
          textAlign: TextAlign.right,
          surah.surahName,
          style: TextStyle(fontFamily: 'Amiri'),
        ),
      ),
    );
  }
}
