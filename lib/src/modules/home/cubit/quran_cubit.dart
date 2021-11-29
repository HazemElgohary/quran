import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran/src/models/quran_model.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  List<Surah>? quran;
  Future<void> parseJson(String response)async {
    try{
      emit(QuranLoading());
      final dataParse = await json.decode(response.toString()).cast<Map<String, dynamic>>();
      quran = await dataParse.map<Surah>((e) => Surah.fromJson(e)).toList();

      emit(QuranLoaded(quran!));
    }
    catch(e,st){
      log(st.toString());
      emit(QuranCantLoad(e.toString()));
    }
  }
}
