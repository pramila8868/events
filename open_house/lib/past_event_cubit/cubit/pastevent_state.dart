import 'package:open_house/model/past_model.dart';

abstract class PastEventState {}

class InitPastEventState
    extends PastEventState {} // when pasteventstate is initialize

class LoadingPastEventState
    extends PastEventState {} // when pasteventstate is loading

class ErrorTPastEventState extends PastEventState {
  final String message;
  ErrorTPastEventState(this.message);
}

class ResponsePastEventState extends PastEventState {
  final List<PastEvent> pastevent;
  ResponsePastEventState(this.pastevent);
}
