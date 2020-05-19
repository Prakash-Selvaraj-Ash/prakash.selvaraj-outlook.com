import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tuto/registration/bloc/user_repository.dart';
import 'package:bloc_tuto/registration/registration_model.dart';
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
    if (event is UserNameFocusLost) {
      bool isValidModel = await isValid(
          event.userName, state.model.password, state.model.confirmPassword);
      yield RegistrationModelChanged(state.model
          .copyWith(userName: event.userName, isValid: isValidModel));
    }
    if (event is PasswordFocusLost) {
      bool isValidModel = await isValid(
          state.model.userName, event.password, state.model.confirmPassword);
      yield RegistrationModelChanged(state.model
          .copyWith(password: event.password, isValid: isValidModel));
    }
    if (event is ConfirmPasswordFocusLost) {
      bool isValidModel = await isValid(
          state.model.userName, state.model.password, event.confirmPassword);
      yield RegistrationModelChanged(state.model.copyWith(
          confirmPassword: event.confirmPassword, isValid: isValidModel));
    }
  }

  Future<bool> isValid(
      String userName, String password, String confirmPassword) async {
    bool isValidUser = await _userRepository.isUserAvailable(userName);

    RegExp exp = new RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");

    bool isUserNameValid = userName.length >= 8;
    bool isValidPassword = exp.hasMatch(password);
    bool isConfirmPasswordMatched = password == confirmPassword;

    return isValidUser &&
        isUserNameValid &&
        isValidPassword &&
        isConfirmPasswordMatched;
  }
}
