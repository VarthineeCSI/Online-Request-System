import 'package:equatable/equatable.dart';

// * RequestDetailListState
// * @Author: 
// * @Create Date: 
abstract class RequestDetailListState extends Equatable {}

class RequestDetailListLoadingState extends RequestDetailListState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingRequestDetailListState{}";
}

class RequestDetailListLoadedState extends RequestDetailListState {
  final List<dynamic> items;

  RequestDetailListLoadedState(this.items){
     print("-----RequestDetailListLoadedState-----");
    print(items);
  }

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedRequestDetailListState{}";
}

class RequestDetailListErrorState extends RequestDetailListState {
  @override
  List<Object> get props => [];
}
