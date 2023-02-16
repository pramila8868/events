import 'package:open_house/model/past_model.dart';

abstract class PastEventState {}

class InitPastEventState
    extends PastEventState {} // when pasteventstate is initialize

class LoadingPastEventState
    extends PastEventState {} // when pasteventstate is loading

class ApiNoData extends PastEventState {}

class ApiNoInternet extends PastEventState {}

class ErrorTPastEventState extends PastEventState {
  final String message;
  ErrorTPastEventState(this.message);
}

class LoadedPastEventState extends PastEventState {
  final List<PastEvent> pastevent;
  LoadedPastEventState(this.pastevent);
}
