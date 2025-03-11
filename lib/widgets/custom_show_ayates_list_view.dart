
import 'package:flutter/material.dart';
import 'package:lastfivesectionsofquran/models/werd_model.dart';

class CustomShowAyatesListView extends StatelessWidget {
  const CustomShowAyatesListView({
    super.key,
    required this.werd,
  });

  final Werd werd;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: werd.ayats.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            textAlign: TextAlign.right,
            werd.ayats[index],
            style: TextStyle(fontFamily: 'Amiri', height: 2),
          ),
        );
      },
    );
  }
}
