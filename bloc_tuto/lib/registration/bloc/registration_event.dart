part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class UserNameChanged extends RegistrationEvent {
  final String userName;
  UserNameChanged(this.userName);
  @override
  List<Object> get props => [userName];
}

class PasswordChanged extends RegistrationEvent{
  final String password;
  PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends RegistrationEvent{
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}
