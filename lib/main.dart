import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastfivesectionsofquran/constants.dart';
import 'package:lastfivesectionsofquran/cubit/audio_cubit/audio_state.dart' show AudioInitial;
import 'package:lastfivesectionsofquran/helper/font_size_provider.dart';
import 'package:lastfivesectionsofquran/models/model_to_store_werd.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';
import 'package:lastfivesectionsofquran/models/werd_model.dart';

import 'package:lastfivesectionsofquran/screens/home_page.dart' show HomePage;
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cubit/audio_cubit/audio_cubit.dart' show AudioCubit;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); 

  Hive.registerAdapter(WerdToStoreAdapter()); 
  Hive.registerAdapter(SurahAdapter());
  Hive.registerAdapter(WerdAdapter());
  await Hive.openBox<WerdToStore>(kBoxName);

  final fontSizeProvider = FontSizeProvider();
  await fontSizeProvider.loadFontSize();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AudioCubit(AudioInitial()),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => fontSizeProvider,
        child: MyApp(),
      ),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

 
  @override
  Widget build(BuildContext context) {
    return Consumer<FontSizeProvider>(
      builder: (context, fontSizeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _getThemeData(fontSizeProvider, _isDarkMode),
          home: HomePage(
            isDarkMode: _isDarkMode,
            onThemeChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
            },
            onFontSizeChanged: (double value) {
              fontSizeProvider.setFontSize(
                value,
              );
            },
          ),
        );
      },
    );
  }
   ThemeData _getThemeData(FontSizeProvider fontSizeProvider, bool isDarkMode) {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: fontSizeProvider.fontSize),
        bodyMedium: TextStyle(fontSize: fontSizeProvider.fontSize),
        bodySmall: TextStyle(fontSize: fontSizeProvider.fontSize),
      ),
    );
  }

}
// done the app