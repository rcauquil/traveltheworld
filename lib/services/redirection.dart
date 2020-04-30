import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:traveltheworld/models/user.dart';
import 'package:traveltheworld/services/auth.dart';
import 'package:traveltheworld/screens/loading/loading.dart';
import 'package:traveltheworld/screens/home/home.dart';
import 'package:traveltheworld/screens/authenticate/authenticate.dart';

class RedirectionService {

  StreamBuilder builder = StreamBuilder(
    stream: AuthService().user,
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.done:
        case ConnectionState.waiting:
          return Loading();
          break;
        case ConnectionState.active:
          if (snapshot.data == null) {
            return Authenticate();
          } else {
            return Provider<UserModel>(
              create: (_) => snapshot.data,
              child: Home(),
            );
          }
          break;
        default:
          return Loading();
      }
    },
  );

}