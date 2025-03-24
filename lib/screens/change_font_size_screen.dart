import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/helper/font_size_provider.dart';
import 'package:provider/provider.dart';

class FontSizeSettingsScreen extends StatelessWidget {
  const FontSizeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSizeProvider = Provider.of<FontSizeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تغيير حجم الخط",
          style: TextStyle(fontFamily: 'Amiri', fontSize: 25),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "هذا نص تجريبي",
            style: TextStyle(
              fontSize: fontSizeProvider.fontSize,
              fontFamily: 'Amiri',
            ),
          ),
          Slider(
            min: 12.0,
            max: 30.0,
            value: fontSizeProvider.fontSize,
            onChanged: (newSize) {
              fontSizeProvider.setFontSize(newSize);
            },
          ),
        ],
      ),
    );
  }
}
