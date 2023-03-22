import 'package:app_financy/common/models/user_model.dart';
import 'package:app_financy/features/sign_up/sign_up_controller.dart';
import 'package:app_financy/features/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockSecureStorage = MockSecureStorage();
    signUpController =
        SignUpController(mockFirebaseAuthService, mockSecureStorage);
    user = UserModel(
      name: 'user',
      email: 'user@gmail.com',
      id: '1a2b3c4d5e',
    );
  });

  test('Tests Sign up controller success state', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());
    when(
      () => mockSecureStorage.write(
        key: 'CURRENT_USER',
        value: user.toJson(),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockFirebaseAuthService.signUp(
        name: 'user',
        email: 'user@gmail.com',
        password: 'user@123',
      ),
    ).thenAnswer(
      (_) async => user,
    );

    await signUpController.signUp(
      name: 'user',
      email: 'user@gmail.com',
      password: 'user@123',
    );
    expect(signUpController.state, isInstanceOf<SignUpSuccessState>());
  });

  test('Tests Sign up controller error state', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());
    when(
      () => mockSecureStorage.write(
        key: 'CURRENT_USER',
        value: user.toJson(),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockFirebaseAuthService.signUp(
        name: 'user',
        email: 'user@gmail.com',
        password: 'user@123',
      ),
    ).thenThrow(
      Exception(),
    );

    await signUpController.signUp(
      name: 'user',
      email: 'user@gmail.com',
      password: 'user@123',
    );
    expect(signUpController.state, isInstanceOf<SignUpErrorState>());
  });
}
