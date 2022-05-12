import 'package:flutter/material.dart';
import 'package:field_flutter/views/bottom_menu.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 52),
            child: Text('maps')),
        bottomNavigationBar: BottomMenu(),
      );
}
