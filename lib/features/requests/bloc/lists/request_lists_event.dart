import 'package:equatable/equatable.dart';

// * RequestListEvent
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
abstract class RequestListEvent extends Equatable {}

class FetchRequestList extends RequestListEvent {
  final String userCode;
  FetchRequestList(this.userCode);
  @override
  List<Object> get props => [];
}

class FetchDefaultRequestList extends RequestListEvent {
  FetchDefaultRequestList();
  @override
  List<Object> get props => [];
}