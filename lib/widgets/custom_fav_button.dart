import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/screens/fav_screen.dart';

class CustomFavButton extends StatelessWidget {
  const CustomFavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FavScreen();
            },
          ),
        );
      },
      icon: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.favorite, size: 27),
      ),
    );
  }
}
