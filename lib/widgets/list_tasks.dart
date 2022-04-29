import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            Provider.of<TaskData>(context).tasks[index].task!,
            style: TextStyle(
                decoration: Provider.of<TaskData>(context).tasks[index].isDone
                    ? TextDecoration.lineThrough
                    : null),
          ),
          trailing: TaskCheckbox(
            checkboxState: Provider.of<TaskData>(context).tasks[index].isDone,
            //CallBack
            onChange: (state) {
              Provider.of<TaskData>(context, listen: false).checkTask(
                  Provider.of<TaskData>(context, listen: false).tasks[index]);
              // setState(() {
              //   widget.tasks[index].isDone = state!;
              // });
            },
          ),
          onLongPress: () {
            Provider.of<TaskData>(context, listen: false).deleteTask(
                Provider.of<TaskData>(context, listen: false).tasks[index]);
          },
        );
      },
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({Key? key, this.checkboxState, required this.onChange})
      : super(key: key);
  final bool? checkboxState;
  final Function(bool?) onChange;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: onChange,
    );
  }
}
