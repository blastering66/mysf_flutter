import 'package:flutter/material.dart';
import 'package:mysff_flutter/screens/Auth/loginscreen.dart';
import 'package:mysff_flutter/screens/Auth/registerscreen.dart';
import 'package:mysff_flutter/screens/Auth/splashscreen.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/authViewModel.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/welcomeViewModel.dart';
import 'package:mysff_flutter/screens/Auth/welcomescreen.dart';
import 'package:mysff_flutter/screens/Home/homescreen.dart';
import 'package:mysff_flutter/screens/More/profilescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    final bool isLoggedIn = authViewModel.isLoggedIn; //Change this with LocalStorage
    print('User is logged in >: $isLoggedIn');
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: isLoggedIn
          ? {
              '/': (context) => HomeScreen(),
              '/profile': (context) => profileScreen(),
            }
          : {
              '/': (context) => Splashscreen(),
              '/login': (context) => LoginScreen(),
              '/register': (context) => RegisterScreen(),
            },
      onGenerateRoute: (setting) {
        print('onGenerateRoute called with setting: ${setting.name}');
        switch (setting.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) =>
                  Splashscreen());
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/home':
            return MaterialPageRoute(builder: (context) => HomeScreen());
          default:MaterialPageRoute(
              builder: (context) =>
                  isLoggedIn ? HomeScreen() : WelcomeScreen());
        }
        
      },
    );
  }
}
