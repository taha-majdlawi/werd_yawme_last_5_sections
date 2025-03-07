import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';

class ShowAllWerdsForSurah extends StatelessWidget {
  const ShowAllWerdsForSurah({super.key, required this.surah});
  final Surah surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surah.surahName), centerTitle: true),
    );
  }
}
