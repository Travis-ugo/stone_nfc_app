import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storage_repository/storage_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final StorageRepositoryImpl storageRepository;
  ProfileBloc({required this.storageRepository}) : super(ProfileState()) {
    on<ProfileRequested>(_onProfileRequested);
  }

  Future<void> _onProfileRequested(
    ProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final profile = await storageRepository
          .getUserProfile(userId: event.userId)
          .then((e) => e.getOrElse(() => null));
      if (profile != null) {
        emit(state.copyWith(status: ProfileStatus.loaded, profile: profile));
      } else {
        emit(
          state.copyWith(
            status: ProfileStatus.error,
            message: 'Profile not found',
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error, message: e.toString()));
    }
  }
}
