abstract class LoginStates {}

class LoginInit extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginError extends LoginStates {
   final String message;

   LoginError({required this.message});
}