import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';

class ShowWerdScreen extends StatelessWidget {
  const ShowWerdScreen({super.key, required this.werd});
  final Werd werd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: werd.ayats.length,
          itemBuilder: (context, index) {
            return Text(
              werd.ayats[index],
              style: TextStyle(fontFamily: 'Amiri'),
            );
          },
        ),
      ),
    );
  }
}
