import 'package:equatable/equatable.dart';

// * WorkFlowStatusEvent
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-17
abstract class WorkFlowStatusEvent extends Equatable {}

class FetchWorkFlowStatus extends WorkFlowStatusEvent {
  final String epNo;
  FetchWorkFlowStatus(this.epNo);
  @override
  List<Object> get props => [];
}
