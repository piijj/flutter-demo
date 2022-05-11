import 'package:field_flutter/views/my_tasks.dart';
import 'package:field_flutter/views/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

import '../models/app_state.dart';
import '../selectors/app_selectors.dart';

class MyTasksScreens extends HookWidget {
  const MyTasksScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeTabIndex =
        useSelector<AppState, int>((state) => myTaskTabSelector(state));
    return Scaffold(
        body: AnimatedSwitcher(
      transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
      duration: const Duration(milliseconds: 800),
      child: IndexedStack(
        key: ValueKey<int>(activeTabIndex),
        index: activeTabIndex,
        children: const [
          MyTasks(),
          Task(),
        ],
      ),
    ));
  }
}
