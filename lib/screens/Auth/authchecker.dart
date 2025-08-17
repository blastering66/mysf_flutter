import 'package:flutter/material.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/authViewModel.dart';
import 'package:mysff_flutter/screens/Auth/welcomescreen.dart';
import 'package:mysff_flutter/screens/Home/homescreen.dart';
import 'package:provider/provider.dart';

class Authchecker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return authViewModel.isLoggedIn
        ? HomeScreen() // Navigate to HomeScreen if logged in
        : WelcomeScreen(); // Navigate to WelcomeScreen if not logged in
  }
}