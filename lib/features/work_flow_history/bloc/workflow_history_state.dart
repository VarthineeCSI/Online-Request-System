import 'package:equatable/equatable.dart';

// * WorkFlowHistoryState
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
abstract class WorkFlowHistoryState extends Equatable {}

class WorkFlowHistoryLoadingState extends WorkFlowHistoryState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingWorkFlowHistoryState{}";
}

class WorkFlowHistoryLoadedState extends WorkFlowHistoryState {
  final List<dynamic> items;

  WorkFlowHistoryLoadedState(this.items){
    print(this.items);
  }

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedWorkFlowHistoryState{}";
}

class WorkFlowHistoryErrorState extends WorkFlowHistoryState {
  @override
  List<Object> get props => [];
}
