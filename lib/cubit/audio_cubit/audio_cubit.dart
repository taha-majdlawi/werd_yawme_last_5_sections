import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastfivesectionsofquran/cubit/audio_cubit/audio_state.dart';
import 'package:lastfivesectionsofquran/models/werd_model.dart';


class AudioCubit extends Cubit<AudioState> {
  AudioCubit(super.initialState);
   AudioPlayer audioPlayer = AudioPlayer();
  bool playing = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  List<String>? mp3File = [];

  isPlaying() {
    emit(NotPlaying());
    if (playing) {
      emit(IsPlaying());
    } else {
      emit(NotPlaying());
    }
  }

  Future<void> playAllAyat(List<String> werdList) async {
    for (var file in werdList) {
      await playAudio(file); // Waits for this Ayah to finish
      emit(IsPlaying());
      await waitForCompletion(); // Ensures we wait for audio to complete
    }
  }

  /// Function to wait until the current audio is finished
  Future<void> waitForCompletion() async {
    final completer = Completer<void>();
    audioPlayer.onPlayerComplete.listen((_) {
      if (!completer.isCompleted) {
        completer.complete();
      }
    });
    return completer.future;
  }

  static String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  String formatNumberWithLeadingZeros(int number, int length) {
    return number.toString().padLeft(length, '0');
  }

//  Future<void> playAudioForEver(List<String> url) async {
//   emit(IsPlaying());
//   playing = true;

//   // Ensure it only loops while the switch is on
//   await audioPlayer.setReleaseMode(ReleaseMode.loop);
//   await audioPlayer.play(AssetSource(url));
// }

  Future<void> playAudio(String url) async {
    emit(IsPlaying());
    await audioPlayer.play(AssetSource(url));
    playing = true;
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    emit(IsPaused());
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    await audioPlayer.setReleaseMode(ReleaseMode.stop);
    (() => position = Duration.zero);
    emit(IsStopped());
  }

  Future<void> seekAudio(Duration newPosition) async {
    await audioPlayer.seek(newPosition);
  }
}
