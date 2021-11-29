import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/src/models/quran_model.dart';
import 'package:quran/src/modules/home/cubit/quran_cubit.dart';
import 'package:quran/src/modules/quran_surahs/quran_surahs_screen.dart';
import 'package:quran/src/modules/surah/surah_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = QuranCubit();
    return Scaffold(

      body: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/quran.json'),
            builder: (context, snapshot) {
              cubit.parseJson(snapshot.data.toString());
              return BlocConsumer<QuranCubit,QuranState>(
                bloc: cubit,
                listener: (context, state) {},
                builder: (context, state) {
                  Surah? surah;
                  if(state is QuranLoading){
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                  if(state is QuranLoaded){
                    state.quran.map((e) {
                       surah = e;
                    }).toList();
                    return state.quran.isNotEmpty
                        ? QuranSurahsScreen(list: state.quran)
                        : const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                  if(state is QuranCantLoad){
                    log(state.msg);
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                  return const SizedBox();
                },
              );
            }),

      ),
    );
  }
}