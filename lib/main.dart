import 'package:field_flutter/views/home.dart';
import 'package:field_flutter/views/login_screen.dart';
import 'package:field_flutter/views/maps.dart';
import 'package:field_flutter/views/my_tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Field Flutter',
      theme: ThemeData(
          fontFamily: 'Overpass', scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      routes: {'/tasks': (context) => MyTasks(), '/maps': (context) => Maps()},
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraines) {
            return Row(
              children: [
                Visibility(
                  visible: constraines.maxWidth >= 1200,
                  child: Expanded(
                    child: Container(
                      height: double.infinity,
                      color: Theme.of(context).colorScheme.primary,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Firebase Auth Desktop',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: constraines.maxWidth >= 1200
                      ? constraines.maxWidth / 2
                      : constraines.maxWidth,
                  child: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      debugPrint(snapshot.hasData ? 'hello' : 'hi');
                      if (snapshot.hasData) {
                        return const Home();
                      }
                      return Login();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
