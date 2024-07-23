import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_item.dart';
import 'package:get/get.dart';
import '../controller/shared_preference_controller.dart';
import 'confirmation_dialog.dart';



class TaskListView extends StatelessWidget {

  final String profile_name;

  const TaskListView({
    super.key,
    required this.profile_name
  });

  @override
  Widget build(BuildContext context) {

    final SharedPreferenceController sharedPreferenceController = Get.find();
    // sharedPreferenceController.loadTasks(profile_name);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      sharedPreferenceController.loadTasks(profile_name);
    });

    return Obx(() {

      return ListView.builder(
        itemCount: sharedPreferenceController.tasks.length,
        itemBuilder: (context, index) {
          final task = sharedPreferenceController.tasks[index];
          final isChecked = sharedPreferenceController.taskStates[index];

          return Dismissible(
              key: Key(task),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.grey[100]),
              ),
            confirmDismiss: (direction) async {
              return await ConfirmationDialog().showConfirmationDialog(context, 'task', task);
            },
            onDismissed: (direction) {
              sharedPreferenceController.removeTask(profile_name, index);
              Get.snackbar('Task Deleted', 'The task "$task" was deleted successfully.');
            },
              child: TaskItem(
                title: task,
                isChecked: isChecked,
                onChanged: (bool? value) {
                  if (value != null) {
                    sharedPreferenceController.updateTaskState(index, value);
                  }
                },
              ),
          );
        },
      );
    });
  }
}