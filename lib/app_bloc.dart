import 'package:flutter_bloc/flutter_bloc.dart';

import '../rep/repo.dart';
import './app_events.dart';
import './app_state.dart';
import 'get.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final LoadData _loadData;
  final int id;
  List<Users> usrs = [];
  UserBloc(
    this._loadData,
    this.id,
  ) : super(UserLoadingState()) {
    on<LoaderUserEvent>(((event, emit) async {
      emit(UserLoadingState());
      //emit(UserLoadedState());
      try {
        final users = await _loadData.getDetails();
        usrs = users;
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    }));
  }
  void addUsers(Users us) {
    this.usrs = usrs + [us];
    emit(UserLoadedState(usrs));
  }

  void removeUser(Users us) {
    List<Users> u = this.usrs;
    u.remove(us);
    this.usrs = u;
    emit(UserLoadedState(u));
  }

  void modifyUsers(Users us) {
    List<Users> u = this.usrs;
    int x = u.length;
    int index = 0;
    for (int i = 0; i < x; i++) {
      if (u[i].id == us.id) {
        index = i;
        break;
      }
    }
    u[index] = us;
    usrs = u;
    emit(UserLoadedState(u));
  }
}
