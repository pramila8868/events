import 'package:open_house/Organization_detail/organizarion_state.dart';
//import 'package:open_house/past_event_cubit/pastevent_state.dart';
//import 'package:open_house/repository/pastevent_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_house/Organization_detail/repository/organization_repository.dart';
import 'package:open_house/model/organization_detail.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  final OrganizationRepository _repository; // to access api from another file
  OrganizationCubit(this._repository)
      : super(InitOrganizationState()); // start from InitPastEventState
  Future<void> fetchOrganization() async {
    emit(LoadingOrganizationState());
    try {
      final response = await _repository.getOrganization(); //getAll();
      emit(LoadedOrganizationState(response as OrganizationDetail));
    } catch (e) {
      emit(ErrorOrganizationState(e.toString()));
    }
  }
}
