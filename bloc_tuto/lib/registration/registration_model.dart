import 'package:flutter/material.dart';

class RegistrationModel {
  final String userName;
  final String password;
  final String confirmPassword;
  final bool isValidForRegistration;

  factory RegistrationModel.empty() {
    return RegistrationModel("", "", "", false);
  }

  RegistrationModel(this.userName, this.password, this.confirmPassword, this.isValidForRegistration);

  RegistrationModel copyWith(
      {String userName, String password, String confirmPassword, @required isValid}) {
    return RegistrationModel(userName ?? this.userName,
        password ?? this.password, confirmPassword ?? this.confirmPassword, isValid);
  }
}
