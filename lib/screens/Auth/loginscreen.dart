import 'package:flutter/material.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/authViewModel.dart';
import 'package:mysff_flutter/screens/Auth/viewmodel/welcomeViewModel.dart';
// import 'package:mysff_flutter/screens/Home/viewmodel/homeviewmodel.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    final WelcomeScreenViewModel welcomeScreenModel = WelcomeScreenViewModel();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email or Phone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                  final email = emailController.text;
                  final password = passwordController.text;
                  authViewModel.login(email, password).then((_) {
                    if (authViewModel.isLoggedIn) {
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login failed')),
                      );
                    }
                  });
                  print('Email/Phone: $email, Password: $password');
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
