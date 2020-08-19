
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}
class FetchLogin extends LoginEvent {
  @override
  List<Object> get props => [];
}
