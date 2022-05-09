import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_menu.dart';

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 52),
            child: Text('maps')),
        bottomNavigationBar: BottomMenu(),
      );
}
