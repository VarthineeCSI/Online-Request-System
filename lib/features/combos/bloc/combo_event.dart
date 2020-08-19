import 'package:equatable/equatable.dart';

// * ComboEvent
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
abstract class ComboEvent extends Equatable {}

class FetchCombo extends ComboEvent {
  final String comboType;
  FetchCombo(this.comboType) {}
  @override
  List<Object> get props => [];
}

class FetchComboWithFieldName extends ComboEvent {
  final String comboType;
  final String key;
  FetchComboWithFieldName(this.comboType, this.key);
  @override
  List<Object> get props => [];
}

class FetchComboWithDocType extends ComboEvent {
  final String comboType;
  final String docTypeGroup;
  final String docTypeID;
  FetchComboWithDocType(this.comboType,this.docTypeGroup, this.docTypeID);
  @override
  List<Object> get props => [];
}

class SearchTextChanged extends ComboEvent {
  final String text;
  SearchTextChanged(this.text);
  @override
  List<Object> get props => [];
}
