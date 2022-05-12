import 'package:field_flutter/colors.dart';
import 'package:field_flutter/services/auth_service.dart';
import 'package:field_flutter/views/bottom_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

// TODO: save user to redux
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

    debugPrint(user.toString());

    super.initState();
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
      bottomNavigationBar: const BottomMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 68),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/binoculars.svg',
                width: 130, height: 145, semanticsLabel: 'No Projects'),
            const SizedBox(height: 24),
            const Text(
              'You haven’t been added to a project yet!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Overpass',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.title,
              ),
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
                  color: AppColors.defaultColor,
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
