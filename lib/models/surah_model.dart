import 'package:hive/hive.dart';
import 'package:lastfivesectionsofquran/models/werd_model.dart';

part 'surah_model.g.dart'; // تأكد من إضافة هذا السطر

@HiveType(typeId: 0) // ✅ كل كلاس يجب أن يكون له typeId فريد
class Surah extends HiveObject {
  @HiveField(0)
  final int surahNumber;

  @HiveField(1)
  final String surahName;

  @HiveField(2)
  final List<Werd> werd; // ✅ تأكد أن `Werd` لديه Adapter أيضًا

  Surah({
    required this.surahNumber,
    required this.surahName,
    required this.werd,
  });
}
