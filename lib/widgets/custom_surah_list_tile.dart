import 'package:flutter/material.dart';

class CustomSurahListTile extends StatelessWidget {
  const CustomSurahListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
      elevation: 5,
      child: ListTile(
        leading: Text(
          '1-6',
          style: TextStyle(fontFamily: 'Amiri', fontSize: 18),
        ),
        title: Text(
          textAlign: TextAlign.right,
          'الاحقاف',
          style: TextStyle(fontFamily: 'Amiri', fontSize: 18),
        ),
        subtitle: Text(textAlign: TextAlign.right, '1'),
      ),
    );
  }
}
