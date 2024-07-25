part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;

  const factory UserEvent.getUser() = _GetUser;

  const factory UserEvent.login({
    required String email,
    required String password,
  }) = _LoginEvent;

  const factory UserEvent.createUser({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) = _CreateUser;

  const factory UserEvent.logout() = _LogoutEvent;
}