import 'package:field_flutter/views/my_tasks_page/task_item.dart';
import 'package:flutter/material.dart';

class TasksLists extends StatelessWidget {
  const TasksLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: const [
          TaskItem(
            taskName: 'Reorient Vertical Louver Blinds',
            parentName: 'Realign Air Diffusers',
          ),
          TaskItem(
            taskName: 'Reorient Vertical Louver Blinds',
          ),
          TaskItem(
              taskName: 'Reorient Vertical Louver',
              parentName: 'Realign Air Diffusers ')
        ],
      );
}
