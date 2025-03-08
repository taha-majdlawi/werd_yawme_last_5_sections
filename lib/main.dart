import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/helper/font_size_provider.dart';
import 'package:lastfivesectionsofquran/screens/home_page.dart' show HomePage;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final fontSizeProvider = FontSizeProvider();
  await fontSizeProvider.loadFontSize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => fontSizeProvider,
      child: MyApp(),
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
