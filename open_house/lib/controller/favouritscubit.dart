import 'package:flutter_bloc/flutter_bloc.dart';
class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit() : super(false);

  void toggle() => emit(!state);
}