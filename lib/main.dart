import 'package:field_flutter/models/models.dart';
import 'package:field_flutter/reducers/app_reducer.dart';
import 'package:field_flutter/views/logged_in_screens.dart';
import 'package:field_flutter/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store =
      Store<AppState>(appReducer, initialState: AppState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Field Flutter',
          theme: ThemeData(
              fontFamily: 'Overpass', scaffoldBackgroundColor: Colors.white),
          home: Scaffold(
            body: LayoutBuilder(
              builder: (context, constraines) {
                return SizedBox(
                  width: constraines.maxWidth >= 1200
                      ? constraines.maxWidth / 2
                      : constraines.maxWidth,
                  child: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      debugPrint(snapshot.hasData ? 'hello' : 'hi');
                      if (snapshot.hasData) {
                        return const LoggedInScreens();
                      }
                      return Login();
                    },
                  ),
                );
              },
            ),
          ),
        ));
  }
}
