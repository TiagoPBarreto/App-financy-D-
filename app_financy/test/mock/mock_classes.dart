import 'package:app_financy/features/sign_in/sign_in_controller.dart';
import 'package:app_financy/features/sign_up/sign_up_controller.dart';
import 'package:app_financy/services/auth_service.dart';
import 'package:app_financy/services/secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthService extends Mock implements AuthService {}

class MockSecureStorage extends Mock implements SecureStorage {}
