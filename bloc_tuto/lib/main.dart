import 'package:bloc_tuto/registration/bloc/registration_bloc.dart';
import 'package:bloc_tuto/registration/bloc/user_repository.dart';
import 'package:bloc_tuto/registration/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (ctx) => RegistrationBloc(userRepository),
      child: RegistrationPage(),
    ));
  }
}
