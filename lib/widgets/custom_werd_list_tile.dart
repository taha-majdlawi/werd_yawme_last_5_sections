import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lastfivesectionsofquran/constants.dart';
import 'package:lastfivesectionsofquran/models/model_to_store_werd.dart';
import 'package:lastfivesectionsofquran/models/surah_model.dart';

import 'package:lastfivesectionsofquran/screens/show_werd_screen.dart';

class CustomWerdListTile extends StatefulWidget {
  const CustomWerdListTile({
    super.key,
    required this.surah,
    required this.index,
    required this.isFavScreen,
  });

  final Surah surah;
  final int index;
  final bool isFavScreen;

  @override
  State<CustomWerdListTile> createState() => _CustomWerdListTileState();
}

class _CustomWerdListTileState extends State<CustomWerdListTile> {
  late WerdToStore werdToStore;
  @override
  void initState() {
    super.initState();
    // إنشاء الـ object مرة واحدة فقط عند بداية بناء الواجهة
    werdToStore = WerdToStore(index: widget.index, surah: widget.surah);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ShowWerdScreen(
                surah:  widget.surah,
                werd: widget.surah.werd[widget.index],
            
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                if (checkCategoryExists(werdToStore)) {
                  var box = Hive.box<WerdToStore>(kBoxName);
                  for (var key in box.keys) {
                    var storedWerd = box.get(key);
                    if (storedWerd?.objIndex == werdToStore.objIndex) {
                      box.delete(key); // استخدم المفتاح لحذف العنصر
                      print("${werdToStore.objIndex} تم الحذف!");
                      setState(() {});
                      return;
                    }
                  }

                  setState(() {});
                } else {
                  var AyatBox = Hive.box<WerdToStore>(kBoxName);
                  AyatBox.put(
                    werdToStore.objIndex,
                    werdToStore,
                  ); 
                  setState(() {});
                }
              },
              icon: Icon(
                checkCategoryExists(werdToStore)
                    ? Icons.star
                    : Icons.star_border_outlined,
              ),
            ),
            title: Center(
              child: Text(
                widget.isFavScreen
                    ? widget.surah.werd[widget.index].werdFromTo +
                        '          ' +
                        widget.surah.surahName
                    : widget.surah.werd[widget.index].werdFromTo,
                style: TextStyle(fontFamily: 'Amiri', fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool checkCategoryExists(WerdToStore werdToStore) {
    var box = Hive.box<WerdToStore>(kBoxName);
    for (var key in box.keys) {
      var storedWerd = box.get(key);
      if (storedWerd?.objIndex == werdToStore.objIndex) {
        return true;
      }
    }
    return false;
  }
}
