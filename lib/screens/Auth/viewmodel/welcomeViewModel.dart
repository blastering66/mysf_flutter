import 'package:flutter/material.dart';

class WelcomeScreenViewModel {
  void navToLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void navToRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void navToHome(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  void navBack(BuildContext context) {
    Navigator.pop(context);
  }
}
