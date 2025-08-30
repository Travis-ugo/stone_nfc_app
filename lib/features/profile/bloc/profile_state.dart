part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.profile = UserProfileEntity.empty,
    this.message,
    this.status = ProfileStatus.initial,
  });

  final UserProfileEntity profile;
  final ProfileStatus status;
  final String? message;
  @override
  List<Object?> get props => [profile, message, status];
  ProfileState copyWith({
    UserProfileEntity? profile,
    String? message,
    ProfileStatus? status,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}

enum ProfileStatus { initial, loading, loaded, error }
