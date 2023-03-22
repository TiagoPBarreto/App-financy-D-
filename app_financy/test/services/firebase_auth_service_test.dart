import 'package:app_financy/common/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock_classes.dart';

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(name: 'user', email: 'user@gmail.com', id: '1a2b3c4d5e');
  });

  group(
    'Tests sign up',
    () {
      test('Test sign up success', () async {
        when(
          () => mockFirebaseAuthService.signUp(
            name: 'user',
            email: 'user@gmail.com',
            password: 'user@123',
          ),
        ).thenAnswer(
          (_) async => user,
        );
        final result = await mockFirebaseAuthService.signUp(
          name: 'user',
          email: 'user@gmail.com',
          password: 'user@123',
        );

        expect(result, user);
      });

      test('Test sign up failure', () async {
        when(
          () => mockFirebaseAuthService.signUp(
            name: 'user',
            email: 'user@gmail.com',
            password: 'user@123',
          ),
        ).thenThrow(
          Exception(),
        );

        expect(
          () => mockFirebaseAuthService.signUp(
            name: 'user',
            email: 'user@gmail.com',
            password: 'user@123',
          ),
          throwsException,
        );
      });
    },
  );
}
