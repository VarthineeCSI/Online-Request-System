import 'package:equatable/equatable.dart';

// * RequestFilterEvent
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
abstract class RequestFilterEvent extends Equatable {}

class AddComboValue extends RequestFilterEvent {
  final String comboValue;
  final String comboType;
  AddComboValue(this.comboValue,this.comboType);
  @override
  List<Object> get props => [];
}
