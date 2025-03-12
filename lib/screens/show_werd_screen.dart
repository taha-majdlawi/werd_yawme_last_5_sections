import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastfivesectionsofquran/cubit/audio_cubit/audio_cubit.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';
import 'package:lastfivesectionsofquran/models/werd_model.dart';
import 'package:lastfivesectionsofquran/widgets/custom_show_ayates_list_view.dart';
import 'package:lastfivesectionsofquran/widgets/custom_tabBar_aoudio_player.dart';

class ShowWerdScreen extends StatefulWidget {
  const ShowWerdScreen({
    super.key,
    required this.werd,
    required this.surah,
    required this.isDarkMode,
  });
  final Werd werd;

  final Surah surah;
  final bool isDarkMode;

  @override
  State<ShowWerdScreen> createState() => _ShowWerdScreenState();
}

class _ShowWerdScreenState extends State<ShowWerdScreen> {
  AudioCubit? _audioCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _audioCubit ??= context.read<AudioCubit>(); // حفظ المرجع مرة واحدة
  }

  @override
  void dispose() {
    if (_audioCubit != null) {
      _audioCubit!.audioPlayer.stop();
      _audioCubit!.duration = Duration.zero; // ضبط القيم بأمان
      _audioCubit!.position = Duration.zero;
      _audioCubit!.playing = false;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.isDarkMode ? Colors.black : Color.fromARGB(255, 227, 226, 234),
      appBar: AppBar(
        backgroundColor:
            widget.isDarkMode
                ? Colors.black
                : Color.fromARGB(255, 227, 226, 234),
        title: Text(
          textAlign: TextAlign.right,
          widget.werd.werdFromTo + '          ' + widget.surah.surahName,
          style: TextStyle(fontFamily: 'Amiri'),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: CustomShowAyatesListView(werd: widget.werd)),
        ],
      ),
      bottomNavigationBar: CustomBottombarSound(
        isDarkMode: widget.isDarkMode,
        ayatIndex: 2,
        mp3File: widget.werd.mp3File,
      ),
    );
  }
}
