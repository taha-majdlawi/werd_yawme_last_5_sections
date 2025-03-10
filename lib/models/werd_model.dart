import 'package:hive/hive.dart';

part 'werd_model.g.dart'; // تأكد من إضافة هذا السطر

@HiveType(typeId: 1) // ✅ Type ID مختلف عن Surah
class Werd extends HiveObject {
  @HiveField(0)
  final String werdFromTo;

  @HiveField(1)
  final List<String> ayats;

  Werd({
    required this.werdFromTo,
    required this.ayats,
  });
}
