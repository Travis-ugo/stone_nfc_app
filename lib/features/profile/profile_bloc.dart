import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storage_repository/storage_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final StorageRepositoryImpl storageRepository;
  ProfileBloc({required this.storageRepository}) : super(ProfileInitial()) {
    on<ProfileRequested>(_onProfileRequested);
    on<ProfileUpdated>(_onProfileUpdated);
  }

  Future<void> _onProfileRequested(ProfileRequested event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final profile = await storageRepository.getUserProfile(userId: event.userId).then((e) => e.getOrElse(() => null));
      if (profile != null) {
        emit(ProfileLoaded(profile));
      } else {
        emit(ProfileError('Profile not found'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void _onProfileUpdated(ProfileUpdated event, Emitter<ProfileState> emit) {
    emit(ProfileLoaded(event.profile));
  }
}
