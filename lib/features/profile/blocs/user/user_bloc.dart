import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';
import '../../profile.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<UserEvent>((event, emit) {
      event.map(
        started: (value) {
          emit(UserState.initial());
        },
        getUser: (value) async {
          try {
            emit(state.copyWith(status: Status.loading));

            final user = await Database().getUser();

            emit(state.copyWith(status: Status.authenticated, user: user));
          } catch (e) {
            emit(state.copyWith(
                status: Status.unauthenticated, error: e.toString()));
          }
        },
        login: (value) async {
          try {
            emit(state.copyWith(status: Status.loading));

            final response =
                await Database().login(value.email, value.password);

            if (response.$1) {
              final user = await Database().getUser();

              emit(state.copyWith(
                  status: Status.success, message: response.$2, user: user));
            } else {
              emit(state.copyWith(status: Status.failure, error: response.$2));
            }
          } on Database catch (e) {
            emit(state.copyWith(status: Status.failure, error: e.toString()));
          }
        },
        createUser: (value) {},
        logout: (value) async {
          try {
            await Database().logout();
            emit(UserState.initial());
          } catch (e) {
            emit(state.copyWith(status: Status.failure, error: e.toString()));
          }
        },
      );
    });
  }
}
