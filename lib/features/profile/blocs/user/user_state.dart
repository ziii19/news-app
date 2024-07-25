part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required Status status,
    String? message,
    String? error,
    UserModel? user,
  }) = _UserState;

  factory UserState.initial() {
    return const UserState(
      status: Status.initial,
      message: null,
      error: null,
      user: null,
    );
  }
}
