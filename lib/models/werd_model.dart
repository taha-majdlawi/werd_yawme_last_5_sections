import 'package:hive/hive.dart';

part 'werd_model.g.dart';

@HiveType(typeId: 1)
class Werd extends HiveObject {
  @HiveField(0)
  final String werdFromTo;

  @HiveField(1)
  final List<String> ayats;

  @HiveField(2)
   List<String>? mp3File;

  Werd({this.mp3File, required this.werdFromTo, required this.ayats});
}
