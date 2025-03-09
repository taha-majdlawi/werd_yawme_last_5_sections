import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/constants.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';
import 'package:lastfivesectionsofquran/widgets/custom_fav_button.dart';
import 'package:lastfivesectionsofquran/widgets/custom_werd_list_tile.dart';

class ShowAllWerdsForSurah extends StatelessWidget {
  const ShowAllWerdsForSurah({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 226, 234),
      appBar: AppBar(
        actions: [CustomFavButton()],
        backgroundColor: Color.fromARGB(255, 227, 226, 234),
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
