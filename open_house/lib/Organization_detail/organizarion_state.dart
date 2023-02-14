import 'package:open_house/model/organization_detail.dart';
import 'package:open_house/model/past_model.dart';

abstract class OrganizationState {}

class InitOrganizationState
    extends OrganizationState {} // when pasteventstate is initialize

class LoadingOrganizationState
    extends OrganizationState {} // when pasteventstate is loading

class ErrorOrganizationState extends OrganizationState {
  final String message;
  ErrorOrganizationState(this.message);
}

class ResponseOrganizationState extends OrganizationState {
  final List<OrganizationDetail>  organization;
  ResponseOrganizationState(this.organization);
}
