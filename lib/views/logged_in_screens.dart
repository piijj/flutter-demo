import 'package:field_flutter/models/models.dart';
import 'package:field_flutter/views/home.dart';
import 'package:field_flutter/views/maps.dart';
import 'package:field_flutter/views/my_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoggedInScreens extends StatelessWidget {
  const LoggedInScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.activeTab,
      builder: (context, acitveTabIndex) => Scaffold(
        body: IndexedStack(
          index: acitveTabIndex,
          children: [
            const Home(), // Replace these widgets with your widgets
            MyTasks(),
            Maps(),
            const Home(),
          ],
        ),
      ),
    );
  }
}
