import 'package:equatable/equatable.dart';

// * RequestDetailEvent
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-08-14
abstract class RequestDetailEvent extends Equatable {}

class FetchRequestDetail extends RequestDetailEvent {
  final String requestDetailType;
  FetchRequestDetail(this.requestDetailType);
  @override
  List<Object> get props => [];
}
