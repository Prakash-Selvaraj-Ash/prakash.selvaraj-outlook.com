import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tuto/registration/bloc/registration_bloc.dart';
import 'package:bloc_tuto/registration/bloc/user_repository.dart';
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
          isA<RegistrationModelChanged>()
              .having((source) => source.model.userName, 'checkUserName',
                  equals('testUser'))
              .having((source) => source.model.password, 'password is empty',
                  isEmpty)
              .having((source) => source.model.confirmPassword,
                  'confirm password is empty', isEmpty)
        ],
        verify: (_) async {
          verify(repo.isUserAvailable('testUser')).called(1);
        });

    blocTest('password changed state',
        build: () async => bloc,
        act: (b) async => b.add(PasswordFocusLost('password')),
        expect: [
          isA<RegistrationModelChanged>()
              .having((source) => source.model.password, 'checkPassword',
                  equals('password'))
              .having((source) => source.model.userName, 'userName is empty',
                  isEmpty)
              .having((source) => source.model.confirmPassword,
                  'confirm password is empty', isEmpty)
        ],
        verify: (_) async {
          verify(repo.isUserAvailable('')).called(1);
        });

    blocTest('confirm password changed state',
        build: () async => bloc,
        act: (b) async => b.add(ConfirmPasswordFocusLost('password')),
        expect: [
          isA<RegistrationModelChanged>()
              .having((source) => source.model.confirmPassword,
                  'checkConfirmPassword', equals('password'))
              .having((source) => source.model.userName, 'userName is empty',
                  isEmpty)
              .having((source) => source.model.password, 'password is empty',
                  isEmpty)
        ],
        verify: (_) async {
          verify(repo.isUserAvailable('')).called(1);
        });

    when(repo.isUserAvailable(''))
        .thenAnswer((realInvocation) => Future.value(true));

    test('IsValid - empty userName', () async {
      var isValid = await bloc.isValid('', 'password', 'confirmPassword');
      expect(isValid, false);
    });

    when(repo.isUserAvailable('existingUser'))
        .thenAnswer((realInvocation) => Future.value(false));
    test('IsValid - already existing userName', () async {
      var isValid =
          await bloc.isValid('existingUser', 'password', 'confirmPassword');
      expect(isValid, false);
    });

    when(repo.isUserAvailable('user'))
        .thenAnswer((realInvocation) => Future.value(true));
    test('IsValid - userName length less than 8', () async {
      var isValid = await bloc.isValid('user', 'password', 'confirmPassword');
      expect(isValid, false);
    });

    test('IsValid - password empty', () async {
      var isValid = await bloc.isValid('testUser', '', 'confirmPassword');
      expect(isValid, false);
    });

    test('IsValid - password regex not matched', () async {
      var isValid =
          await bloc.isValid('testUser', 'password', 'confirmPassword');
      expect(isValid, false);
    });

    test('IsValid - confirm password empty', () async {
      var isValid = await bloc.isValid('testUser', 'a123456789A#', '');
      expect(isValid, false);
    });

    test('IsValid - confirm password not matched with password', () async {
      var isValid =
          await bloc.isValid('testUser', 'a123456789A#', 'confirmPassword');
      expect(isValid, false);
    });

    test('IsValid - true', () async {
      var isValid =
          await bloc.isValid('testUser', 'a123456789A#', 'a123456789A#');
      expect(isValid, true);
    });
  });
}
