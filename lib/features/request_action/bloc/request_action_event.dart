import 'package:equatable/equatable.dart';

// * RequestActionEvent
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19
abstract class RequestActionEvent extends Equatable {}

class FetchRequestAction extends RequestActionEvent {
  FetchRequestAction();
  @override
  List<Object> get props => [];
}
