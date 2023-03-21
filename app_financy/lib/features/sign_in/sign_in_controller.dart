import 'package:app_financy/features/sign_in/sign_in_state.dart';

import 'package:flutter/foundation.dart';

class SignInController extends ChangeNotifier {
  SignInState _state = SignInStateInitial();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }
}
