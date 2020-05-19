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
                    addToRegistrationBloc(context, UserNameFocusLost(val))),
            buildTextField(
                'Password',
                true,
                (val) =>
                    addToRegistrationBloc(context, PasswordFocusLost(val))),
            buildTextField(
                'Confirm Password',
                true,
                (val) => addToRegistrationBloc(
                    context, ConfirmPasswordFocusLost(val))),
            BlocBuilder<RegistrationBloc, RegistrationState>(
              builder: (context, state) {
                return RaisedButton(
                  onPressed: state != null && state.model.isValidForRegistration
                      ? () {}
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

  void addToRegistrationBloc(BuildContext context, RegistrationEvent event) {
    return context.bloc<RegistrationBloc>().add(event);
  }
}
