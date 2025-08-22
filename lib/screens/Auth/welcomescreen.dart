import 'package:flutter/material.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/welcomeviewmodel.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeScreenViewModel vModel = WelcomeScreenViewModel();

  final List<String> images = const [
    "assets/images/welcome_img_1.png",
    "assets/images/welcome_img_2.png",
    "assets/images/welcome_img_3.png",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: PageView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/logo/smartfren.png",
                                  fit: BoxFit.contain,
                                  width: 100,
                                  height: 24,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: Image.asset(
                                  images[index],
                                  fit: BoxFit.contain,
                                  width: 100,
                                  height: 100,
                                ),
                                ),
                                Text("Welcome to MySF"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => vModel.navToLogin(context),
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => vModel.navToRegister(context),
                        child: Text("Register"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
