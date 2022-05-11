import 'package:field_flutter/actions/menu_action.dart';
import 'package:field_flutter/views/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

import '../models/app_state.dart';

class MyTasks extends HookWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dispatch = useDispatch<AppState>();
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 52),
          child: Column(
            children: [
              const Text('my tasks'),
              TextButton(
                onPressed: () => dispatch(SwitchMyTaskTab(myTaskTab: 1)),
                child: const Text('Task'),
              )
            ],
          )),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
