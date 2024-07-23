import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final RxBool isChecked;
  final ValueChanged<bool?> onChanged;

  TaskItem({
    required this.title,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
   return Obx(() {
     return ListTile(
       title: Text(title,
         style: isChecked.value
             ? TextStyle(decoration: TextDecoration.lineThrough)
             : null,),
       trailing: Obx(() => Checkbox(
         value: isChecked.value,
         onChanged: (bool? value) {
           if (value != null) {
             isChecked.value = value;
             onChanged(value);
           }
         },
         activeColor: Colors.green,
       )),
     );
   });
  }
}