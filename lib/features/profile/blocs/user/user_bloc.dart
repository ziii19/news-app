import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/profile/models/models.dart';

import '../../../../core/core.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
