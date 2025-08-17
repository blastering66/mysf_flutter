import 'package:flutter/material.dart';
import 'package:mysff_flutter/screens/Home/viewmodel/moreviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/authViewModel.dart';

class MoreTabScreen extends StatefulWidget {
  const MoreTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoreTabState();
  }
}

class _MoreTabState extends State<MoreTabScreen> {

  @override
  Widget build(BuildContext context) {
    // final moreViewModel = context.watch<MoreViewModel>();
     // Call logout method on init
    return Scaffold(
      appBar: AppBar(
        title: Text('More Tab'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the More Tab!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // moreViewModel.goToProfile(context);
              },
              child: Text('Profile Detail'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your action here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You just logged out!')),
                );
                // moreViewModel.doLogout(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}