import 'package:open_house/past_event_cubit/cubit/pastevent_state.dart';
import 'package:open_house/past_event_cubit/repository/pastevent_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PastEventCubit extends Cubit<PastEventState> {
  final PastEventRepository _repository; // to access api from another file
  PastEventCubit(this._repository)
      : super(InitPastEventState()); // start from InitPastEventState
  Future<void> fetchPastEvent() async {
    emit(LoadingPastEventState());
    try {
      final response = await _repository.getAll();
      emit(ResponsePastEventState(response));
    } catch (e) {
      emit(ErrorTPastEventState(e.toString()));
    }
  }
}
