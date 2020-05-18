import 'package:bloc_tuto/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc pattern'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FocusScope(
              onFocusChange: (focus) {
                context
                    .bloc<RegistrationBloc>()
                    .add(UserNameFocusLost(userNameTextController.text));
              },
              child: TextField(
                decoration: InputDecoration(hintText: 'UserName'),
                controller: userNameTextController,
              ),
            ),
            FocusScope(
              onFocusChange: (focus) {
                context
                    .bloc<RegistrationBloc>()
                    .add(PasswordFocusLost(passwordTextController.text));
              },
              child: TextField(
                decoration: InputDecoration(hintText: 'Password'),
                controller: passwordTextController,
              ),
            ),
            FocusScope(
              onFocusChange: (focus) {
                context.bloc<RegistrationBloc>().add(ConfirmPasswordFocusLost(
                    confirmPasswordTextController.text));
              },
              child: TextField(
                decoration: InputDecoration(hintText: 'Confirm Password'),
                controller: confirmPasswordTextController,
              ),
            ),
            BlocBuilder<RegistrationBloc, RegistrationState>(
              builder: (context, state) {
                return RaisedButton(
                  onPressed: state.model.isValidForRegistration ? () {} : null,
                  child: Text('Register'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
