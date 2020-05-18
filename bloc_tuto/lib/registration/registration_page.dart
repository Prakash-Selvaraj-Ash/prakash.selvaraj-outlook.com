import 'package:bloc_tuto/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController userNameTextController = TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();

  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    userNameTextController.addListener(() {
      addToRegistrationBloc(
          context, UserNameFocusLost(userNameTextController.text));
    });

    passwordTextController.addListener(() {
      addToRegistrationBloc(
          context, PasswordFocusLost(passwordTextController.text));
    });

    confirmPasswordTextController.addListener(() {
      addToRegistrationBloc(context,
          ConfirmPasswordFocusLost(confirmPasswordTextController.text));
    });
  }

  @override
  void dispose() {
    super.dispose();
    userNameTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc pattern'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            buildTextField('UserName', false, userNameTextController),
            buildTextField('Password', true, passwordTextController),
            buildTextField(
                'Confirm Password', true, confirmPasswordTextController),
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

  TextField buildTextField(
      String hintText, bool isObscure, TextEditingController controller) {
    return TextField(
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  void addToRegistrationBloc(BuildContext context, RegistrationEvent event) {
    return context.bloc<RegistrationBloc>().add(event);
  }
}
