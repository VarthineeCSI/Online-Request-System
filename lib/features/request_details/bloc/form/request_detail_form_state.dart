import 'package:equatable/equatable.dart';

// * RequestDetailState
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-08-14
abstract class RequestDetailState extends Equatable {}

class RequestDetailLoadingState extends RequestDetailState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingRequestDetailState{}";
}

class RequestDetailLoadedState extends RequestDetailState {
  final List<dynamic> items;

  RequestDetailLoadedState(this.items){
    print(items);
  }

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedRequestDetailState{}";
}

class RequestDetailErrorState extends RequestDetailState {
  @override
  List<Object> get props => [];
}
