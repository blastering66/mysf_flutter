import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/authViewModel.dart';


class MoreViewModel {

  void doLogout(BuildContext context) {
    // Call the logout method from the AuthViewModel
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    authViewModel.logout();
  }

  void goToProfile(BuildContext context) {
    // Navigate to the profile screen
    Navigator.pushNamed(context, '/profile');
  }
}