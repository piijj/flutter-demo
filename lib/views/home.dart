import 'dart:developer';

import 'package:field_flutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  String? photoURL;
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      debugPrint('$index');
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          elevation: 0,
          title: SvgPicture.asset('assets/svg/field_workmark.svg',
              width: 150, height: 24, semanticsLabel: 'Acme Logo'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                maxRadius: 18,
                backgroundImage: NetworkImage(
                  user.photoURL ?? placeholderImage,
                ),
              ),
            )
          ]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.listCheck),
              label: 'My Tasks',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.map),
              label: 'Maps',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bell),
              label: 'Notifications',
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: const Color.fromRGBO(18, 120, 236, 1),
          unselectedItemColor: const Color.fromRGBO(102, 112, 148, 1),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          iconSize: 14,
          onTap: _onItemTapped),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 68),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/user_no_project.svg',
                width: 130, height: 145, semanticsLabel: 'No Projects'),
            const SizedBox(height: 24),
            const Text(
              'You haven’t been added to a project yet!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(8, 16, 77, 1)),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Text(
                'Speak to your Project Admin or get in touch with Aphex',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(57, 64, 113, 1),
                ),
              ),
            ),
            TextButton(
              onPressed: () => AuthService().signOut(),
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
