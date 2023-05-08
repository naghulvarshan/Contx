import 'package:equatable/equatable.dart';
import 'package:contx/get.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<Users> users;
  UserLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

class UserDetailsLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserDetailsLoadedState extends UserState {
  final Users users;
  UserDetailsLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

class UserDetailsAdded extends UserState {
  final List<Users> users;
  UserDetailsAdded(this.users);
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String msg;
  UserErrorState(this.msg);
  @override
  List<Object> get props => [msg];
}
