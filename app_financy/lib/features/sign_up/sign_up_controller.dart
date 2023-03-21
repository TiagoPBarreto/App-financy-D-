import 'package:app_financy/features/sign_up/sign_up_state.dart';
import 'package:app_financy/services/auth_service.dart';

import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;
  SignUpController(this._service);
  SignUpState _state = SignUpInitialState();
  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp(
      {required String? name,
      required String email,
      required String password}) async {
    _changeState(SignUpLoadingState());

    try {
      await _service.signUp(email: email, password: password);
      _changeState(SignUpSuccessState());
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
