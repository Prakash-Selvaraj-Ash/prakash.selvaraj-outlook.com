import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tuto/registration/bloc/user_repository.dart';
import 'package:bloc_tuto/registration/model/registration_model.dart';
import 'package:equatable/equatable.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserRepository _userRepository;
  RegistrationBloc(this._userRepository);

  @override
  RegistrationState get initialState => RegistrationInitial();

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is UserNameChanged) {
      bool isValidModel = await isValid(
          event.userName, state.model.password, state.model.confirmPassword);
      yield RegistrationModelChanged(state.model
          .copyWith(userName: event.userName, isValid: isValidModel));
    }
    if (event is PasswordChanged) {
      bool isValidModel = await isValid(
          state.model.userName, event.password, state.model.confirmPassword);
      yield RegistrationModelChanged(state.model
          .copyWith(password: event.password, isValid: isValidModel));
    }
    if (event is ConfirmPasswordChanged) {
      bool isValidModel = await isValid(
          state.model.userName, state.model.password, event.confirmPassword);
      yield RegistrationModelChanged(state.model.copyWith(
          confirmPassword: event.confirmPassword, isValid: isValidModel));
    }
  }

  Future<bool> isValid(
      String userName, String password, String confirmPassword) async {
    bool isValidUser = await _userRepository.isUserAvailable(userName); //username is available to create

    RegExp exp = new RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");

    bool isUserNameValid = userName.length >= 8; // user name should have more than or equal to 8 characters
    bool isValidPassword = exp.hasMatch(password); // password should have one small case, one upper case, one number and one symbol
    bool isConfirmPasswordMatched = password == confirmPassword; // confirm password should match with the above password

    return isValidUser &&
        isUserNameValid &&
        isValidPassword &&
        isConfirmPasswordMatched; // true if all the conditions are true, else false
  }
}
