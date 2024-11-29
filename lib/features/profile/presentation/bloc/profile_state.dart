class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileLoagingState extends ProfileState {}

class GetProfileSuccessState extends ProfileState {}

class UpdateProfileLoagingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String massage;

  ProfileErrorState({required this.massage});
}
