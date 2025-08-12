import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
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
              child: ElevatedButton(onPressed: () {}, child: Text("Login")),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: () {}, child: Text("Register")),
            )
          ],
        ),
      ),
    );
  }
}
