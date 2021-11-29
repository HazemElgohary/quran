part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}
class QuranLoading extends QuranState {}
class QuranLoaded extends QuranState {
  final List<Surah> quran;


  QuranLoaded(this.quran,);
}
class QuranCantLoad extends QuranState {
  final String msg;

  QuranCantLoad(this.msg);
}
