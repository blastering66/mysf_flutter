import 'package:flutter/material.dart';
import 'package:mysf_flutter/screens/Auth/welcomescreen.dart';

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

  void refreshToken() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
    goToWelcome();
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
              child: Image.asset(
                'assets/logo/smartfren.png',
                height: 200,
                width: 200,
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
