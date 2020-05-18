import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tuto/registration/bloc/registration_bloc.dart';
import 'package:bloc_tuto/registration/bloc/user_repository.dart';
import 'package:bloc_tuto/registration/registration_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  group("registration bloc", () {
    RegistrationBloc bloc;
    var repo = UserRepositoryMock();
    setUp(() {
      bloc = RegistrationBloc(repo);
    });

    test('InitialState', () {
      expect(bloc.initialState.model.userName, '');
      expect(bloc.initialState.model.password, '');
      expect(bloc.initialState.model.confirmPassword, '');
      expect(bloc.initialState.model.isValidForRegistration, false);
    });

    when(repo.isUserAvailable('testUser'))
        .thenAnswer((realInvocation) => Future.value(true));
    blocTest('User name changed state',
        build: () async => bloc,
        act: (b) async => b.add(UserNameFocusLost('testUser')),
        expect: [
          RegistrationModelChanged(RegistrationModel.empty()
              .copyWith(isValid: true, userName: 'testUser'))
        ]);
  });
}
