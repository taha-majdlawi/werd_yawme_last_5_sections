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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FontSizeProvider>(
      builder: (context, fontSizeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: fontSizeProvider.fontSize),
              bodyMedium: TextStyle(fontSize: fontSizeProvider.fontSize),
              bodySmall: TextStyle(fontSize: fontSizeProvider.fontSize),
            ),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
