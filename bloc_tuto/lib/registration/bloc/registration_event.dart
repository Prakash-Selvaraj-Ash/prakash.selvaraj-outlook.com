part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class UserNameFocusLost extends RegistrationEvent {
  final String userName;
  UserNameFocusLost(this.userName);
  @override
  List<Object> get props => [userName];
}

class PasswordFocusLost extends RegistrationEvent{
  final String password;
  PasswordFocusLost(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordFocusLost extends RegistrationEvent{
  final String confirmPassword;
  ConfirmPasswordFocusLost(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}
