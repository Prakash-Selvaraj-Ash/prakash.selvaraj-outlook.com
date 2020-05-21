import 'package:bloc_tuto/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc pattern'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            buildTextField(
                'UserName',
                false,
                (val) =>
                    context.bloc<RegistrationBloc>().add(UserNameChanged(val))),
            buildTextField(
                'Password',
                true,
                (val) =>
                    context.bloc<RegistrationBloc>().add(PasswordChanged(val))),
            buildTextField(
                'Confirm Password',
                true,
                (val) => context
                    .bloc<RegistrationBloc>()
                    .add(ConfirmPasswordChanged(val))),
            BlocBuilder<RegistrationBloc, RegistrationState>(
              condition: (oldState, newState) =>
                  oldState.model.isValidForRegistration !=
                  newState.model.isValidForRegistration, // re-build only when isValid changed from oldstate.
              builder: (context, state) {
                return RaisedButton(
                  onPressed: state != null && state.model.isValidForRegistration
                      ? () {} // enable press call only when model is valid for registration
                      : null,
                  child: Text('Register'),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  TextField buildTextField(
      String hintText, bool isObscure, ValueChanged<String> onChangedCallback) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(hintText: hintText),
      onChanged: onChangedCallback,
    );
  }
}
