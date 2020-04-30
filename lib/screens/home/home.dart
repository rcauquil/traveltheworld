import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveltheworld/models/user.dart';
import 'package:traveltheworld/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {    
    final user = Provider.of<UserModel>(context);
    
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            textColor: Theme.of(context).accentColor,
            label: Text(''),
          )
        ],
      ),
      body: Center(
        child: Text(user.uid),
      ),
    );
  }
}