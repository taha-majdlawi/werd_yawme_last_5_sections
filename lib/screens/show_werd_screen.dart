import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';

class ShowWerdScreen extends StatelessWidget {
  const ShowWerdScreen({super.key, required this.werd});
  final Werd werd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 226, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 226, 234),
        title: Text(
          textAlign: TextAlign.right,
          werd.werdFromTo,
          style: TextStyle(fontFamily: 'Amiri'),
        ),
      ),
      body: Column(
        children: [
          Text(
            "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
            style: TextStyle(fontFamily: 'Amiri', fontSize: 25),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: werd.ayats.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    textAlign: TextAlign.right,
                    werd.ayats[index],
                    style: TextStyle(fontFamily: 'Amiri'),
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
