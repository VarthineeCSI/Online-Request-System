import 'package:equatable/equatable.dart';

// * RequestFilterState
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
abstract class RequestFilterState extends Equatable {}

class RequestFilterLoadingState extends RequestFilterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingRequestFilterState{}";
}

class RequestFilterLoadedState extends RequestFilterState {
  final Object value;

  RequestFilterLoadedState(this.value);

  @override
  List<Object> get props => [value];

  @override
  String toString() => "LoadedRequestFilterState{}";
}

class RequestFilterErrorState extends RequestFilterState {
  @override
  List<Object> get props => [];
}


class AddValueExpenseStatusLoadedState extends RequestFilterState {
  final String value;
  AddValueExpenseStatusLoadedState(this.value);
  @override
  List<Object> get props => [value];
  @override
  String toString() => "AddValueExpenseStatusLoadedState{}";
}

class AddValueExpenseTypeLoadedState extends RequestFilterState {
  final String value;
  AddValueExpenseTypeLoadedState(this.value);
  @override
  List<Object> get props => [value];
  @override
  String toString() => "AddValueExpenseStatusLoadedState{}";
}

class AddValueOrganizationLoadedState extends RequestFilterState {
  final String value;
  AddValueOrganizationLoadedState(this.value);
  @override
  List<Object> get props => [value];
  @override
  String toString() => "AddValueOrganizationLoadedState{}";
}

class AddValueWorkflowStatusLoadedState extends RequestFilterState {
  final String value;
  AddValueWorkflowStatusLoadedState(this.value);
  @override
  List<Object> get props => [value];
  @override
  String toString() => "AddValueWorkflowStatusLoadedState{}";
}