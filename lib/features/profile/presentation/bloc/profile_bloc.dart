import 'package:bookia_app/features/profile/data/model/response/get_profile_response/get_profile_response.dart';
import 'package:bookia_app/features/profile/data/repo/profile_repo.dart';
import 'package:bookia_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:bookia_app/features/profile/presentation/bloc/profile_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>(getProfile);
    on<UpdateProfileEvent>(updateProfile);
  }

  GetProfileResponse? profileResponse;

  Future<void> getProfile(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(GetProfileLoagingState());

    try {
      await ProfileRepo.getProfile().then(
        (value) {
          if (value != null) {
            profileResponse = value;
            emit(GetProfileSuccessState());
          } else {
            emit(ProfileErrorState(
                massage: "Unexpected Error occur, please try again"));
          }
        },
      );
    } on Exception {
      emit(ProfileErrorState(
          massage: "Unexpected Error occur, please try again"));
    }
  }


   Future<void> updateProfile(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(UpdateProfileLoagingState());

    try {
      await ProfileRepo.updateProfile(event.params).then(
        (value) {
          if (value ) {
            
            emit(UpdateProfileSuccessState());
          } else {
            emit(ProfileErrorState(
                massage: "Unexpected Error occur, please try again"));
          }
        },
      );
    } on Exception {
      emit(ProfileErrorState(
          massage: "Unexpected Error occur, please try again"));
    }
  }

  
}
