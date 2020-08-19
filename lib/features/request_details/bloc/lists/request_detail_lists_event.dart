import 'package:equatable/equatable.dart';

// * RequestDetailListEvent
// * @Author: 
// * @Create Date:
abstract class RequestDetailListEvent extends Equatable {}

class FetchRequestDetailList extends RequestDetailListEvent {
  FetchRequestDetailList();
  @override
  List<Object> get props => [];
}
