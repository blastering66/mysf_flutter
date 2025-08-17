import 'package:flutter/material.dart';
import 'package:mysff_flutter/screens/Auth/components/logo.dart';
import 'package:mysff_flutter/screens/Auth/welcomescreen.dart';
import 'package:mysff_flutter/screens/Home/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Splashscreen();
}

class _Splashscreen extends State<Splashscreen> {
  bool isLoading = false;

  void goToWelcome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (Route<dynamic> route) => false);
  }

    void goToHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  void refreshToken() async {
    setState(() {
      isLoading = true;
    });
    final sPref =  await SharedPreferences.getInstance();
    // goToWelcome();
    if (sPref.getBool('isLoggedIn') ?? false) {
      goToHome();  
    } else {
      goToWelcome();
    }
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshToken();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 200,
              height: 200,
              child: Logo(
                width: 200,
                height: 200,
              )),
          SizedBox(
            width: 50,
            height: 50,
            child: isLoading ? CircularProgressIndicator() : Container(),
          ),
        ],
      ),
    )));
  }
}
