import 'package:equatable/equatable.dart';

// * ComboState
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
abstract class ComboState extends Equatable {}

class ComboLoadingState extends ComboState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingComboState{}";
}

class ComboLoadedState extends ComboState {
  final List<dynamic> items;

  ComboLoadedState(this.items){
    print(items);
  }

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedComboState{}";
}

class ComboErrorState extends ComboState {
  @override
  List<Object> get props => [];
}