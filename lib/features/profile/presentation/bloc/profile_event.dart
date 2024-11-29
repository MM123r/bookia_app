import 'package:bookia_app/features/profile/data/model/request/edit_user_model_params.dart';

class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final EditUserModelParams params;
  UpdateProfileEvent({required this.params});
}
