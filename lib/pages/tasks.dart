import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/add_button.dart';
import '../widgets/task_list_view.dart';

class Tasks extends StatelessWidget {

  final String profile_name;

  const Tasks({
    super.key,
    required this.profile_name
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${profile_name} tasks'),
      ),
      body: Container(
        color: Colors.grey[100],
        width: ScreenUtil().setWidth(360),
        height: ScreenUtil().setHeight(690),
        child: Column(
          children: [
            Expanded(
              child: TaskListView(profile_name: profile_name,),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: AddButton(name: 'task', profile_name: profile_name,),
              ),
            ),
          ],
        ),
      )
    );
  }
}