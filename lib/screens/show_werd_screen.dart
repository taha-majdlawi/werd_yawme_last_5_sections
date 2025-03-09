import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';

class ShowWerdScreen extends StatelessWidget {
  const ShowWerdScreen({
    super.key,
    required this.werd,
    required this.surahName,
  });
  final Werd werd;
  final String surahName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 226, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 226, 234),
        title: Text(
          textAlign: TextAlign.right,
          werd.werdFromTo + '          ' + surahName,
          style: TextStyle(fontFamily: 'Amiri'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: werd.ayats.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    textAlign: TextAlign.right,
                    werd.ayats[index],
                    style: TextStyle(fontFamily: 'Amiri', height: 2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
