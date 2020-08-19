import 'package:equatable/equatable.dart';

// * WorkFlowStatusState
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-17
abstract class WorkFlowStatusState extends Equatable {}

class WorkFlowStatusLoadingState extends WorkFlowStatusState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingWorkFlowStatusState{}";
}

class WorkFlowStatusLoadedState extends WorkFlowStatusState {
  final List<dynamic> items;

  WorkFlowStatusLoadedState(this.items){
    print(this.items);
  }

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedWorkFlowStatusState{}";
}

class WorkFlowStatusErrorState extends WorkFlowStatusState {
  @override
  List<Object> get props => [];
}
