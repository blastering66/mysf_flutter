import 'package:flutter/material.dart';

class PackageTabScreen extends StatefulWidget {
  const PackageTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PackageTabState();
  }
}

class _PackageTabState extends State<PackageTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package Tab'),
      ),
      body: Center(
        child: Text('Welcome to the Package Tab!'),
      ),
    );
  }
}