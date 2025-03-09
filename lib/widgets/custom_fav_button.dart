
import 'package:flutter/material.dart';

class CustomFavButton extends StatelessWidget {
  const CustomFavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
      icon: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.favorite, size: 27),
      ),
    );
  }
}
