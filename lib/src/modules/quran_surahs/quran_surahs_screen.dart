import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/src/models/quran_model.dart';
import 'package:quran/src/modules/surah/surah_screen.dart';

class QuranSurahsScreen extends StatelessWidget {
  final List<Surah> list;
  const QuranSurahsScreen({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('القران الكريم'),
      ),
      body: ListView(
        children: list.map((e) {
          return InkWell(
            onTap: () => Get.to(SurahScreen(surah: e)),
            child: Card(
              child: ListTile(
                title: Text(e.name),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
