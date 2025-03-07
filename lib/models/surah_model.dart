class Surah {
  final int surahNumber;
  final String surahName;
  final List<Werd> werd;

  Surah( {required this.surahName, required this.surahNumber, required this.werd});
}

class Werd {
  final String werdFromTo;
  final List<String> ayats;

  Werd({required this.werdFromTo, required this.ayats});
}
