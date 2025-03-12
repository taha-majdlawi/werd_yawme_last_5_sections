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
  });
  final int ayatIndex;
  final List<String>? mp3File;

  @override
  State<CustomBottombarSound> createState() => _CustomBottombarSoundState();
}

class _CustomBottombarSoundState extends State<CustomBottombarSound> {
  bool isSwitched = false;
  void initState() {
    super.initState();
    context.read<AudioCubit>().mp3File = widget.mp3File;
    // Listening for player state changes
    context.read<AudioCubit>().audioPlayer.onPlayerStateChanged.listen((
      PlayerState state,
    ) {
      if (mounted) {
        setState(() {
          context.read<AudioCubit>().playing = state == PlayerState.playing;
        });
      }
    });

    // Listen to duration changes
    context.read<AudioCubit>().audioPlayer.onDurationChanged.listen((
      Duration d,
    ) {
      if (mounted) {
        setState(() => context.read<AudioCubit>().duration = d);
      }
    });

    // Listen to position changes
    context.read<AudioCubit>().audioPlayer.onPositionChanged.listen((
      Duration p,
    ) {
      if (mounted) {
        setState(() => context.read<AudioCubit>().position = p);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AudioCubit>(context).isPlaying();
    return BottomAppBar(
      height: 150,
      shape: CircularNotchedRectangle(),
      color: Color.fromARGB(255, 227, 226, 234),
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
                  max: context.read<AudioCubit>().duration.inSeconds.toDouble(),
                  value: context
                      .read<AudioCubit>()
                      .position
                      .inSeconds
                      .toDouble()
                      .clamp(
                        0.0,
                        context
                            .read<AudioCubit>()
                            .duration
                            .inSeconds
                            .toDouble(),
                      ), // ضبط القيمة داخل الحدود
                  onChanged: (value) {
                    context.read<AudioCubit>().audioPlayer.seek(
                      Duration(seconds: value.toInt()),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        AudioCubit.formatTime(
                          context.read<AudioCubit>().position,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        AudioCubit.formatTime(
                          context.read<AudioCubit>().duration,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        context.read<AudioCubit>().playing
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: () async {
                        if (context.read<AudioCubit>().playing) {
                          await context.read<AudioCubit>().pauseAudio();
                        } else {
                          if (context.read<AudioCubit>().mp3File != null) {
                            await context.read<AudioCubit>().playAllAyat(
                              context.read<AudioCubit>().mp3File!,
                            );
                          } else {
                            await context.read<AudioCubit>().playAllAyat([]);
                            await context.read<AudioCubit>().playAllAyat([]);
                            await context.read<AudioCubit>().playAllAyat([]);
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.stop),
                      onPressed: context.read<AudioCubit>().stopAudio,
                    ),
                    context.read<AudioCubit>().mp3File != null
                        ? Switch(
                          onChanged: (value) async {
                            isSwitched = value;
                            setState(() {
                              isSwitched = value;
                            });
                            if (value) {
                              for (int i = 0; i < 500; i++) {
                                //    debugPrint('$i');
                                await context.read<AudioCubit>().playAllAyat(
                                  context.read<AudioCubit>().mp3File!,
                                );
                              }
                            } else {
                              context.read<AudioCubit>().stopAudio();
                            }
                            if (!value) {}
                          },
                          value: isSwitched,
                        )
                        : SizedBox(),
                    context.read<AudioCubit>().mp3File != null
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
