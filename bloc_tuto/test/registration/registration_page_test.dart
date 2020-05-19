import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tuto/registration/bloc/registration_bloc.dart';
import 'package:bloc_tuto/registration/registration_model.dart';
import 'package:bloc_tuto/registration/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRegistrationBloc
    extends MockBloc<RegistrationEvent, RegistrationState>
    implements RegistrationBloc {}

void main() {
  RegistrationBloc bloc;
  group('Registration Page - userName Changed', () {
    setUp(() {
      bloc = MockRegistrationBloc();
    });

    testWidgets('user name changed', (WidgetTester tester) async {
      const String userName = 'userName';
      RegistrationPage page = RegistrationPage();
      when(bloc.add(UserNameFocusLost(userName))).thenAnswer((_) =>
          RegistrationModelChanged(RegistrationModel.empty()
              .copyWith(isValid: true, userName: userName)));

      await tester.pumpWidget(BlocProvider.value(
          value: bloc,
          child: MaterialApp(
            home: page,
          )));

      await tester.pumpAndSettle();

      var finder = find.byType(TextField);

      var buttonFinder = find.byType(RaisedButton);

      await tester.pump();

      expect(finder, findsNWidgets(3));
      expect(buttonFinder, findsOneWidget);

      await tester.pump();
      await tester.enterText(finder.at(0), userName);

      await tester.pumpAndSettle();

      verify(
        bloc.add(UserNameFocusLost(userName)),
      ).called(1);
    });
  });
}
