part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final User? user;
  const AuthState({this.user});

  const AuthState.initial() : user = null;

  bool get isAuthenticated => user != null;

  @override
  List<Object?> get props => [user];
}
