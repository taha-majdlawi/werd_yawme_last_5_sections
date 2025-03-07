class Surah {
  final int surahNumber;
  final List<Werd> werd;

  Surah({required this.surahNumber, required this.werd});
}

class Werd {
  final String werdFromTo;
  final List<String> ayats;

  Werd({required this.werdFromTo, required this.ayats});
}
