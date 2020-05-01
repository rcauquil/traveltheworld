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
      body: Navigator(
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,        
      ),
    );
  }
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('HOME'),
                  RaisedButton(
                    onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                    child: Text('go to dashboard'),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                    child: Text('go to settings'),
                  ),
                ],
              ),
            ),
          );
        });
      case '/dashboard':
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('DASHBOARD'),
                  RaisedButton(
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                    child: Text('go to settings'),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                    child: Text('back to home'),
                  ),
                ],
              ),
            ),
          );
        });
      case '/settings':
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('SETTINGS'),
                  RaisedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                    child: Text('back to home'),
                  ),
                ],
              ),
            ),
          );
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}