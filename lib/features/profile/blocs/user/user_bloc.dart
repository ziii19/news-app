import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/profile/models/models.dart';

import '../../../../core/core.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<GetUser>((event, emit) async {
      try {
        emit(state.copywith(status: Status.loading));

        final user = await Database().getUser();

        emit(state.copywith(status: Status.authenticated, user: user));
      } catch (e) {
        emit(state.copywith(
            status: Status.unauthenticated, error: e.toString()));
      }
    });

    on<RegisterEvent>((event, emit) async {
      try {
        emit(state.copywith(status: Status.loading));

        final response = await Database().register(
          username: event.username,
          firstname: event.firstname,
          lastname: event.lastname,
          email: event.email,
          password: event.password,
        );

        if (response.$1) {
          final user = await Database().getUser();

          emit(state.copywith(
              status: Status.success, message: response.$2, user: user));
        } else {
          emit(state.copywith(status: Status.failure, error: response.$2));
        }
      } on Database catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      try {
        emit(state.copywith(status: Status.loading));

        final response = await Database().login(event.email, event.password);

        if (response.$1) {
          final user = await Database().getUser();

          emit(state.copywith(
              status: Status.success, message: response.$2, user: user));
        } else {
          emit(state.copywith(status: Status.failure, error: response.$2));
        }
      } on Database catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        await Database().logout();
        emit(UserState.initial());
      } catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
