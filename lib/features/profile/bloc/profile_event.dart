part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class ProfileRequested extends ProfileEvent {
  final String userId;
  const ProfileRequested(this.userId);
  @override
  List<Object?> get props => [userId];
}

class ProfileUpdated extends ProfileEvent {
  final UserProfileEntity profile;
  const ProfileUpdated(this.profile);
  @override
  List<Object?> get props => [profile];
}
