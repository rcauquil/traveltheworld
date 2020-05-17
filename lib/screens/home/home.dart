import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveltheworld/models/user.dart';
import 'package:traveltheworld/services/auth.dart';
import 'package:traveltheworld/screens/placeholder/placeholder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {  
  final AuthService _auth = AuthService();
  int _currentBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context, listen: false);

    final List<Widget> _children = [
      PlaceholderWidget(Colors.green, Text('Map')),
      PlaceholderWidget(Colors.yellow, Text('Devices')),
      PlaceholderWidget(Colors.orange, Text('Alerts')),
      PlaceholderWidget(Colors.red, Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(user.uid),
          SizedBox(height: 20),
          RaisedButton(
            onPressed: () async => await _auth.signOut(),
            child: Text('Signout'),
          ),
        ]
      ))
    ];

    void _onItemTap(int index) {
      setState(() {
        if (_currentBarIndex != index) {
          _currentBarIndex = index;
        }
      });
    }

    return Scaffold(
      body: _children[_currentBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black26,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _currentBarIndex,
        onTap: _onItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices_other),
            title: Text('Devices'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            title: Text('Alerts')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings')
          ),
        ],
      ),
    );
  }
}