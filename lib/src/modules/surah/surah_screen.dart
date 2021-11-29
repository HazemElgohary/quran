
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/src/models/quran_model.dart';

class SurahScreen extends StatelessWidget {
  final Surah surah;
  const SurahScreen({Key? key,required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(text: TextSpan(text: '',
                children: <TextSpan>[
                  for (var i = 0; i <= surah.ayahs.length-1; i++) ...{
                    TextSpan(
                      text: surah.ayahs[i].text,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    const TextSpan(text: '  '),
                    TextSpan(
                      text: surah.ayahs[i].numberInSurah.toString(),
                      style:  TextStyle(
                        color: Colors.amber,
                        decoration: TextDecoration.combine([
                          TextDecoration.underline,
                          TextDecoration.overline,
                        ]),
                        decorationStyle: TextDecorationStyle.dotted,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: '   '),
                  }
                ],
              ),),
            ),
            // Expanded(
            //   child: ListView.builder(
            //
            //     itemCount: surah.ayahs.length,
            //       itemBuilder: (context, index) => Row(
            //         children: [
            //           Text(listSurah[1].ayahs[index].text,),
            //           Container(
            //             width: 15,
            //             height: 15,
            //             decoration: const BoxDecoration(
            //               color: Colors.amber,
            //               borderRadius: BorderRadius.all(Radius.circular(15)),
            //             ),
            //             child: Center(child: Text(
            //               listSurah[1].ayahs[index].numberInSurah.toString(),
            //               style: const TextStyle(color: Colors.white),)),
            //           ),
            //         ],
            //       ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
