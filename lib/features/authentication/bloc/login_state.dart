
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginLoadingState extends LoginState{
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoadingLoginState{}";
}

class LoginLoadedState extends LoginState{

  final List<dynamic> items;

  LoginLoadedState(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => "LoadedLoginState{}";
}

class LoginErrorState extends LoginState {
  @override
  List<Object> get props => [];
}
