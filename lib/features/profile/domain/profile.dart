import 'package:equatable/equatable.dart';

/// A simple Profile model class.
class Profile extends Equatable {
  final String id;
  final String firstName;
  final String lastName;

  const Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  Profile copyWith({
    String? id,
    String? firstName,
    String? lastName,
  }) {
    return Profile(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  List<Object?> get props => [id, firstName, lastName];
}
