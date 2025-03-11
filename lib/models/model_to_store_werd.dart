import 'package:hive/hive.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';
import 'package:lastfivesectionsofquran/constants.dart';

part 'model_to_store_werd.g.dart'; // ✅ Add this line

@HiveType(typeId: 2) // Unique typeId
class WerdToStore extends HiveObject {
  @HiveField(0)
  final Surah surah;

  @HiveField(1)
  final int index;

  @HiveField(2)
  String? objIndex ;

  WerdToStore({required this.surah, required this.index, }){
    objIndex = surahs.indexOf(surah).toString() + index.toString();
  }
}
