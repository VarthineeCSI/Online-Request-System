import 'package:equatable/equatable.dart';

// * RequestState
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
abstract class RequestState extends Equatable {}

class RequestLoadingState extends RequestState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingRequestState{}";
}

class RequestLoadedState extends RequestState {
  final List<dynamic> items;

  RequestLoadedState(this.items){
    print(items);
  }

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedRequestState{}";
}

class RequestErrorState extends RequestState {
  @override
  List<Object> get props => [];
}
