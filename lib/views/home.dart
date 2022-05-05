import 'dart:developer';

import 'package:field_flutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Displayed as a profile image if the user doesn't have one.
const placeholderImage =
    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

/// Profile page shows after sign in or registerationg
class Home extends StatefulWidget {
  // ignore: public_member_api_docs
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late User user;
  late TextEditingController controller;

  String? photoURL;

  bool showSaveButton = false;
  bool isLoading = false;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;

    FirebaseAuth.instance.userChanges().listen((event) {
      if (event != null && mounted) {
        setState(() {
          user = event;
        });
      }
    });

    log(user.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: 60,
                            backgroundImage: NetworkImage(
                              user.photoURL ?? placeholderImage,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(user.displayName ?? ''),
                      Text(user.email ?? user.phoneNumber ?? 'User'),
                      const SizedBox(height: 10),
                      const SizedBox(height: 40),
                      TextButton(
                        onPressed: () => AuthService().signOut(),
                        child: const Text('Sign out'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.listCheck),
                label: 'My Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Maps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
            ],
          )),
    );
  }
}