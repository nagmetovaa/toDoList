import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_list/widgets/name_text_field.dart';
import 'package:todo_list/widgets/save_button.dart';
import '../controller/shared_preference_controller.dart';

class CreateWindow{
  final SharedPreferenceController _controller = Get.find();

  void showInputDialog(BuildContext context,String profile_name, String title) {
    TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              constraints: BoxConstraints(maxWidth: 400, maxHeight: 250),
              padding: EdgeInsets.all(20.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Text('Add a new $title'),
                    SizedBox(
                      height: 30,
                    ),
                    NameTextField(
                      textController: textController,
                        controller: _controller,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SaveButton(textController:  textController,
                    profile_name: profile_name,
                    controller: _controller,
                    title: title,)
                  ],
                ),
              ),
            )
          );
        }
    );
  }
}