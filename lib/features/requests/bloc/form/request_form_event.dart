import 'package:equatable/equatable.dart';

// * RequestEvent
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
abstract class RequestEvent extends Equatable {}

class FetchRequest extends RequestEvent {
  // final String epNo;
  FetchRequest();
  @override
  List<Object> get props => [];
}
