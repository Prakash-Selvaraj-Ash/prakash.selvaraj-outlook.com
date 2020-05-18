part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  final RegistrationModel model;
  const RegistrationState(this.model);
}

class RegistrationInitial extends RegistrationState {
  RegistrationInitial() : super(RegistrationModel.empty());

  @override
  List<Object> get props => [model];
}

class RegistrationModelChanged extends RegistrationState {
  final RegistrationModel model;
  RegistrationModelChanged(this.model) : super(model);

  @override
  List<Object> get props => [model];
}
