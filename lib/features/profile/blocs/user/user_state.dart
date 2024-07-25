part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    this.status = Status.initial,
    this.message,
    this.error,
    this.user,
  });

  final Status status;
  final String? message;
  final String? error;
  final UserModel? user;

  factory UserState.initial() {
    return const UserState();
  }

  UserState copywith({
    Status? status,
    String? message,
    String? error,
    UserModel? user,
  }) {
    return UserState(
      status: status ?? this.status,
      message: message ?? message,
      error: error ?? error,
      user: user ?? user,
    );
  }

  @override
  List<Object?> get props => [status, message, error, user];
}
