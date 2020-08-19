import 'package:equatable/equatable.dart';

// * RequestListState
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
abstract class RequestListState extends Equatable {}

class RequestListLoadingState extends RequestListState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingRequestListState{}";
}

class RequestListLoadedState extends RequestListState {
  final List<dynamic> items;

  RequestListLoadedState(this.items){
     print("-----RequestListLoadedState-----");
    print(items);
  }

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedRequestListState{}";
}

class RequestListErrorState extends RequestListState {
  @override
  List<Object> get props => [];
}
