
import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';
import 'package:lastfivesectionsofquran/screens/show_werd_screen.dart';

class CustomWerdListTile extends StatelessWidget {
  const CustomWerdListTile({
    super.key,
    required this.surah,
    required this.index,
  });

  final Surah surah;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : (){
       Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ShowWerdScreen(werd: surah.werd[index]);
        }));
      } ,
      child: Card(
        child: ListTile(
          title: Text(surah.surahName, textAlign: TextAlign.right),
      
          leading: Text(
            surah.werd[index].werdFromTo,
            style: TextStyle(fontFamily: 'Amiri', fontSize: 20),
          ),
        ),
      ),
    );
  }
}
