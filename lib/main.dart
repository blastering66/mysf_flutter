import 'package:flutter/material.dart';
import 'package:mysf_flutter/screens/Auth/loginscreen.dart';
import 'package:mysf_flutter/screens/Auth/registerscreen.dart';
import 'package:mysf_flutter/screens/Auth/splashscreen.dart';
import 'package:mysf_flutter/screens/Auth/welcomescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool isLoggedIn = false; //Change this with LocalStorage
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Splashscreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
      onGenerateRoute: (setting) {
        if (setting.name == 'dynamic') {
          return MaterialPageRoute(
              builder: (context) =>
                  isLoggedIn ? WelcomeScreen() : WelcomeScreen());
        }
        return null;
      },
    );
  }
}
