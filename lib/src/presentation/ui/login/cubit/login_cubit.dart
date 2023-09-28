import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  LoginCubit() : super(const LoginState()) {
    loginController.addListener(_validateFields);
    passwordController.addListener(_validateFields);
  }

  void _validateFields() {
    if (loginController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // Enable the button here
      emit(state.copyWith(loginButton: true));
    } else {
      // Disable the button here
      emit(state.copyWith(loginButton: false));
    }
  }

  @override
  Future<void> close() {
    loginController.removeListener(_validateFields);
    passwordController.removeListener(_validateFields);
    loginController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> fetch() async {}

  Future<void> passwordViewClicked(bool passwordView) async {
    emit(state.copyWith(passwordView: !passwordView));
  }
}
