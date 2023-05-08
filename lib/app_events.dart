import 'package:equatable/equatable.dart';

abstract class UserEvents extends Equatable {
  const UserEvents();
}

class LoaderUserEvent extends UserEvents {
  List<Object?> get props => [];
}

// class LoaderUserDetailsEvent extends UserEvents {
//   List<Object?> get props => [];
// }
