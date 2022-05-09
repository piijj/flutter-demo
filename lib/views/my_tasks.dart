import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_menu.dart';

class MyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 52),
            child: Text('my tasks')),
        bottomNavigationBar: BottomMenu(),
      );
}
