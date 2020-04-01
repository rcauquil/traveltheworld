import 'package:flutter/material.dart';
import 'package:traveltheworld/services/auth.dart';

class SignIn extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: // Google Sign In
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text('Google Sign In'),
              onPressed: () async {
                dynamic user = await _auth.signInGoogle();

                if (user == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                  print(user.uid);
                }
              }
            ),
          ),
      ),
    );
  }
}