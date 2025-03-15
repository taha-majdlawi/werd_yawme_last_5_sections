import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastfivesectionsofquran/cubit/audio_cubit/audio_cubit.dart';

class CustomBottombarSound extends StatefulWidget {
  const CustomBottombarSound({
    super.key,
    required this.mp3File,
    required this.ayatIndex,
    required this.isDarkMode,
  });
  final int ayatIndex;
  final List<String>? mp3File;
  final bool isDarkMode;
  @override
  State<CustomBottombarSound> createState() => _CustomBottombarSoundState();
}

class _CustomBottombarSoundState extends State<CustomBottombarSound> {
  bool isSwitched = false;
  late AudioCubit audioCubit;
  @override
  @override
  void initState() {
    super.initState();
    audioCubit = context.read<AudioCubit>();
    audioCubit.mp3File = widget.mp3File;

    // 🔹 الاشتراك في تغيير الموضع
    audioCubit.audioPlayer.onPositionChanged.listen((Duration p) {
      if (mounted) {
        setState(() => audioCubit.position = p);
      }
    });

    // 🔹 الاشتراك في تغيير حالة التشغيل
    audioCubit.audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (mounted) {
        setState(() {
          audioCubit.playing = state == PlayerState.playing;
        });
      }
    });

    // 🔹 الاشتراك في تغيير المدة
    audioCubit.audioPlayer.onDurationChanged.listen((Duration d) {
      if (mounted) {
        setState(() => audioCubit.duration = d);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    audioCubit = context.read<AudioCubit>();
  }

  @override
  @override
  void dispose() {
    audioCubit.audioPlayer.dispose();
    audioCubit.audioPlayer = AudioPlayer(); // إعادة تهيئة AudioPlayer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AudioCubit>(context).isPlaying();
    return BottomAppBar(
      height: 150,
      shape: CircularNotchedRectangle(),
      color:
          widget.isDarkMode ? Colors.black : Color.fromARGB(255, 227, 226, 234),
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  min: 0,
                  max: audioCubit.duration.inSeconds.toDouble(),
                  value: audioCubit.position.inSeconds.toDouble().clamp(
                    0.0,
                    audioCubit.duration.inSeconds.toDouble(),
                  ),
                  onChanged: (value) {
                    audioCubit.audioPlayer.seek(
                      Duration(seconds: value.toInt()),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(AudioCubit.formatTime(audioCubit.position)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(AudioCubit.formatTime(audioCubit.duration)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        audioCubit.playing ? Icons.pause : Icons.play_arrow,
                      ),
                      onPressed: () async {
                        if (audioCubit.playing) {
                          await audioCubit.pauseAudio();
                        } else {
                          if (audioCubit.mp3File != null) {
                            await audioCubit.playAllAyat(audioCubit.mp3File!);
                            setState(() => audioCubit.position = Duration.zero);
                            audioCubit.mp3File = widget.mp3File;
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.stop),
                      onPressed: audioCubit.stopAudio,
                    ),
                    audioCubit.mp3File != null
                        ? Switch(
                          onChanged: (value) async {
                            setState(() {
                              isSwitched = value;
                            });

                            if (!value) {
                              // 🔹 إعادة تعيين المشغل وإيقاف الصوت
                              await audioCubit.stopAudio();
                              audioCubit.audioPlayer.dispose();
                              audioCubit.audioPlayer =
                                  AudioPlayer(); // إعادة إنشاء المشغل الصوتي
                              audioCubit.mp3File = widget.mp3File;
                              // 🔹 إعادة الاشتراك في `onPositionChanged` بعد تعطيل التشغيل التلقائي
                              audioCubit.audioPlayer.onPositionChanged.listen((
                                Duration p,
                              ) {
                                if (mounted) {
                                  audioCubit.mp3File = widget.mp3File;
                                  setState(() => audioCubit.position = p);
                                }
                              });

                              audioCubit.playing = false;
                              audioCubit.mp3File = widget.mp3File;
                              return;
                            }

                        
                            for (int i = 0; i < 500; i++) {
                              if (!isSwitched) {
                                await audioCubit.stopAudio();
                                break;
                              }

                              debugPrint('$i');
                              await audioCubit.playAllAyat(audioCubit.mp3File!);
                              await Future.delayed(Duration(milliseconds: 500));
                            }
                          },
                          value: isSwitched,
                        )
                        : SizedBox(),
                    audioCubit.mp3File != null
                        ? Text(
                          'اعادة التشغيل',
                          style: TextStyle(fontSize: 20, fontFamily: 'Amiri'),
                        )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
