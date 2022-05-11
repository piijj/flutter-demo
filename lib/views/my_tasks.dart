import 'package:flutter/material.dart';
import 'package:field_flutter/views/bottom_menu.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 52),
            child: Text('my tasks')),
        bottomNavigationBar: BottomMenu(),
      );
}
