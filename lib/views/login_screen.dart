import 'package:field_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 52),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/field_workmark.svg',
                  width: 225, height: 36, semanticsLabel: 'Aphex Field Logo'),
              const SizedBox(height: 72),
              SvgPicture.asset('assets/svg/four_hands.svg',
                  width: 175, height: 135, semanticsLabel: 'Welcome'),
              const SizedBox(height: 48),
              const Text(
                'Bring everyone into the plan',
                style: TextStyle(
                    fontFamily: 'Overpass',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(8, 16, 77, 1)),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'Assign and Communicate work between the office and field',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Overpass',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(57, 64, 113, 1),
                  ),
                ),
              ),
              const SizedBox(height: 58),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
                  minimumSize: const Size(double.infinity, 48), // NEW
                ),
                onPressed: () async {
                  AuthService().signInWithGoogle();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 18),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: const Color.fromRGBO(206, 207, 219, 1),
                  minimumSize: const Size(double.infinity, 48), // NEW
                ),
                onPressed: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(57, 64, 113, 1)),
                ),
              )
            ],
          ),
        ),
      );
}
