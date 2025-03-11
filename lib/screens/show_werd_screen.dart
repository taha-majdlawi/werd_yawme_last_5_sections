import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';
import 'package:lastfivesectionsofquran/models/werd_model.dart';
import 'package:lastfivesectionsofquran/widgets/custom_show_ayates_list_view.dart';
import 'package:lastfivesectionsofquran/widgets/custom_tabBar_aoudio_player.dart';

class ShowWerdScreen extends StatelessWidget {
  const ShowWerdScreen({super.key, required this.werd, required this.surah});
  final Werd werd;

  final Surah surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 226, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 226, 234),
        title: Text(
          textAlign: TextAlign.right,
          werd.werdFromTo + '          ' + surah.surahName,
          style: TextStyle(fontFamily: 'Amiri'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomShowAyatesListView(werd: werd),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottombarSound(
        ayatIndex: 2,
        mp3File: werd.mp3File,
      ),
    );
  }
}
