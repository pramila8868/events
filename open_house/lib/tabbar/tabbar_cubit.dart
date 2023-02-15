import 'package:flutter_bloc/flutter_bloc.dart';
class TabCubit extends Cubit<int> {
  TabCubit() : super(0);

  // Step 4: Define the events and states
  void changeTab(int index) => emit(index);
}
