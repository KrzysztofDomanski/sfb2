import 'package:equatable/equatable.dart';
import 'package:sfb/features/profile/domain/profile.dart';

/// Data model for Profile, extending Equatable for value comparison.
class ProfileModel extends Equatable {
  final String id;
  final String firstName;
  final String lastName;

  /// Constructor for ProfileModel.
  const ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  /// Factory method to create ProfileModel from Profile entity.
  factory ProfileModel.fromEntity(Profile profile) {
    return ProfileModel(
      id: profile.id,
      firstName: profile.firstName,
      lastName: profile.lastName,
    );
  }

  /// Converts ProfileModel to Profile entity.
  Profile toEntity() {
    return Profile(
      id: id,
      firstName: firstName,
      lastName: lastName,
    );
  }

  /// Factory method to create ProfileModel from JSON.
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );
  }

  /// Converts ProfileModel to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  @override
  List<Object?> get props => [id, firstName, lastName];
}
