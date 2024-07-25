part of 'user_bloc.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {}

class RegisterEvent extends UserEvent {
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  const RegisterEvent(
      {required this.username,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.password});

  @override
  List<Object> get props => [username, firstname, lastname, email, password];
}

class LoginEvent extends UserEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends UserEvent {}
