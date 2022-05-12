import 'package:field_flutter/views/bottom_menu.dart';
import 'package:field_flutter/views/my_tasks_page/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const placeholderImage =
    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

class MyTasks extends StatelessWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            elevation: 0,
            title: SvgPicture.asset('assets/svg/field_workmark.svg',
                width: 150, height: 24, semanticsLabel: 'Acme Logo'),
            actions: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  maxRadius: 18,
                  backgroundImage: NetworkImage(placeholderImage),
                ),
              )
            ]),
        body: Column(children: const [TasksLists()]),
        bottomNavigationBar: const BottomMenu(),
      );
}
