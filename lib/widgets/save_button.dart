import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controller/shared_preference_controller.dart';

class SaveButton extends StatelessWidget{

  final TextEditingController textController;
  final SharedPreferenceController controller;
  final String title;
  final String profile_name;

  const SaveButton({
    super.key,
    required this.controller,
    required this.textController,
    required this.title,
    required this.profile_name
  });

  @override
  Widget build (BuildContext context) {
    return CupertinoButton
      (child: Text('Save'),
        onPressed: () {
          String data = textController.text;
          if (title == 'profile') {
          controller.addProfile(data);
        }
          if (title == 'task') {
            controller.addTask(profile_name,data);
          }
        Get.back();
        },
      color: Colors.green,
    );

  }
}