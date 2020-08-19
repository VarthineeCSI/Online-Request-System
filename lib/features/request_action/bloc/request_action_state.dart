import 'package:equatable/equatable.dart';

// * RequestActionState
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19
abstract class RequestActionState extends Equatable {}

class RequestActionLoadingState extends RequestActionState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingRequestActionState{}";
}

class RequestActionLoadedState extends RequestActionState {
  final List<dynamic> items;

  RequestActionLoadedState(this.items){
    print(items);
  }

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedRequestActionState{}";
}

class RequestActionErrorState extends RequestActionState {
  @override
  List<Object> get props => [];
}
