import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/constants.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';
import 'package:lastfivesectionsofquran/widgets/custom_werd_list_tile.dart';

class ShowAllWerdsForSurah extends StatelessWidget {
  const ShowAllWerdsForSurah({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.surahName, style: TextStyle(fontFamily: 'Amiri')),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: surah.werd.length,
        itemBuilder: (context, index) {
          return CustomWerdListTile(surah: surah, index: index);
        },
      ),
    );
  }
}
