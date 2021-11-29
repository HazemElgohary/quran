// To parse this JSON data, do
//
//     final quranData = quranDataFromJson(jsonString);

import 'dart:convert';

QuranModel quranDataFromJson(String str) => QuranModel.fromJson(json.decode(str));

String quranDataToJson(QuranModel data) => json.encode(data.toJson());

class QuranModel {
  QuranModel({
    required this.surahs,
  });

  List<Surah> surahs;

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
    surahs: List<Surah>.from(json["surahs"].map((x) => Surah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "surahs": List<dynamic>.from(surahs.map((x) => x.toJson())),
  };
}


class Surah {
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  List<Ayah> ayahs;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    revelationType: json["revelationType"],
    ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "englishName": englishName,
    "englishNameTranslation": englishNameTranslation,
    "revelationType": revelationType,
    "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
  };
}

class Ayah {
  Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    // required this.sajda,
  });

  int number;
  String text;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  // bool sajda;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
    number: json["number"],
    text: json["text"],
    numberInSurah: json["numberInSurah"],
    juz: json["juz"],
    manzil: json["manzil"],
    page: json["page"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    // sajda: json["sajda"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "text": text,
    "numberInSurah": numberInSurah,
    "juz": juz,
    "manzil": manzil,
    "page": page,
    "ruku": ruku,
    "hizbQuarter": hizbQuarter,
    // "sajda": sajda,
  };
}

