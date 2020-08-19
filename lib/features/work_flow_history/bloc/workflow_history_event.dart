import 'package:equatable/equatable.dart';

// * WorkFlowHistoryEvent
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
abstract class WorkFlowHistoryEvent extends Equatable {}

class FetchWorkFlowHistory extends WorkFlowHistoryEvent {
  final String epNo;
  FetchWorkFlowHistory(this.epNo);
  @override
  List<Object> get props => [];
}
