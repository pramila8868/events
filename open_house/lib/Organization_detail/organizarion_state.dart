import 'package:open_house/model/organization_detail.dart';

abstract class OrganizationState {}

class InitOrganizationState
    extends OrganizationState {} // when pasteventstate is initialize

class LoadingOrganizationState
    extends OrganizationState {} // when pasteventstate is loading

class ErrorOrganizationState extends OrganizationState {
  final String message;
  ErrorOrganizationState(this.message);
}


class ApiNoData extends OrganizationState {}

class ApiNoInternet extends OrganizationState {}

class LoadedOrganizationState extends OrganizationState {
//  final List<OrganizationDetail> organization;
  final OrganizationDetail organization;
  LoadedOrganizationState(this.organization);
}
