import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mysff_flutter/screens/Auth/authchecker.dart';
import 'package:mysff_flutter/screens/Auth/loginscreen.dart';
import 'package:mysff_flutter/screens/Auth/registerscreen.dart';
import 'package:mysff_flutter/screens/Auth/splashscreen.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/authViewModel.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/welcomeViewModel.dart';
import 'package:mysff_flutter/screens/Auth/welcomescreen.dart';
import 'package:mysff_flutter/screens/Home/homescreen.dart';
import 'package:mysff_flutter/screens/Home/viewmodel/user_viewmodel.dart';
import 'package:mysff_flutter/screens/More/profilescreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (context) => UserViewModel(),
    ),
    ChangeNotifierProxyProvider<UserViewModel, AuthViewModel>(create: (context) => AuthViewModel(context.read<UserViewModel>()), update: (context, userVM, authVM) => AuthViewModel(userVM),)
    ],
    child: MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      home: Authchecker(),
      onGenerateRoute: (setting) {
        print('onGenerateRoute called with setting: ${setting.name}');
        switch (setting.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) =>
                  Splashscreen());
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/register':  
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/home':
            return MaterialPageRoute(builder: (context) => HomeScreen());
          default:MaterialPageRoute(
              builder: (context) =>
                  Splashscreen());
        }
        
      },
    );
  }
}
