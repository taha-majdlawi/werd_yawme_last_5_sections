
import 'package:flutter/material.dart';

class CustomeTextForHomePage extends StatelessWidget {
  const CustomeTextForHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, right: 20, bottom: 10),
              child: Text(
                textAlign: TextAlign.right,
                "ورد يومي قليلٌ دائم  -",
                style: TextStyle(fontFamily: 'Amiri'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 20, bottom: 50),
          child: Text(
            textAlign: TextAlign.right,
            " ابدأ يومك و لو بآية من الذكر الحكيم تنير دربك وتبارك بها يومك",
            style: TextStyle(fontFamily: 'Amiri'),
          ),
        ),
      ],
    );
  }
}
