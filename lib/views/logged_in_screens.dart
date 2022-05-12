import 'package:field_flutter/models/models.dart';
import 'package:field_flutter/selectors/app_selectors.dart';
import 'package:field_flutter/views/home.dart';
import 'package:field_flutter/views/maps.dart';
import 'package:field_flutter/views/my_tasks_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

class LoggedInScreens extends HookWidget {
  const LoggedInScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeTabIndex =
        useSelector<AppState, int>((state) => activeTabSelector(state));
    return Scaffold(
        body: AnimatedSwitcher(
      transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
      duration: const Duration(milliseconds: 800),
      child: IndexedStack(
        key: ValueKey<int>(activeTabIndex),
        index: activeTabIndex,
        children: const [
          Home(), // Replace these widgets with your widgets
          MyTasksScreens(),
          Maps(),
          Home(),
        ],
      ),
    ));
  }
}
