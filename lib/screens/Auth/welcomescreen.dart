import 'package:flutter/material.dart';
import 'package:mysf_flutter/screens/Auth/viewmodel/welcome.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeScreenViewModel vModel = WelcomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => vModel.navToLogin(context),
                  child: Text("Login")),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => vModel.navToRegister(context),
                  child: Text("Register")),
            )
          ],
        ),
      ),
    );
  }
}
