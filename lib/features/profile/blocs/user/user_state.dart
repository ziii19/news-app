part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial({
    @Default(Status.initial) Status status,
    String? message,
    String? error,
    UserModel? user,
  }) = _Initial;
}
