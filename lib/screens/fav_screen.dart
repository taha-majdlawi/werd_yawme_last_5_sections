import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lastfivesectionsofquran/constants.dart';
import 'package:lastfivesectionsofquran/models/model_to_store_werd.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';

import 'package:lastfivesectionsofquran/widgets/custom_werd_list_tile.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key, required this.isDarkMode});
  final bool isDarkMode;
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<WerdToStore> favWerd = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavList();
  }

  void getFavList() async {
    favWerd = await Hive.box<WerdToStore>(kBoxName).values.toList();
    if (favWerd.isEmpty) {
      print('true');
    } else {
      print('fasle');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' المفضلة', style: TextStyle(fontFamily: 'Amiri')),
        backgroundColor:
            widget.isDarkMode ? null : Color.fromARGB(255, 227, 226, 234),
      ),
      body: ListView.builder(
        itemCount: favWerd.length,
        itemBuilder:
            (context, index) => CustomWerdListTile(
              isDarkMode: widget.isDarkMode,
              surah: favWerd[index].surah,
              index: favWerd[index].index,
              isFavScreen: true,
            ),
      ),
    );
  }
}
