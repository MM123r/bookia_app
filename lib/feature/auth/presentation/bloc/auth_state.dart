class AuthState {}

class AuthInitialState extends AuthState {}

//login
// 1.loading
// 2.Success
// 3.error

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

// هتكون state error للكل
class AuthErrorState extends AuthState {
  //عشان يوضح مشكله
  String message;
  AuthErrorState({required this.message});
}

//Register
// 1.loading
// 2.Success
// 3.error

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

// ف كلاس فوق  ل error
