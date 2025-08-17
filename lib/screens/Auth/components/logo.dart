import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  // final String? imagePath;

  const Logo({Key? key, this.width = 200, this.height = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.asset(
        'assets/images/logo.png', // Ensure this path is correct
        fit: BoxFit.contain,
      ),
    );
  }
}