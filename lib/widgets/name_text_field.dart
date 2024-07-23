import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../controller/shared_preference_controller.dart';
import 'package:get/get.dart';

class NameTextField extends StatelessWidget {

  final SharedPreferenceController controller;
  final TextEditingController textController;

  const NameTextField({
    Key? key,
    required this.controller,
    required this.textController,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: textController,
      placeholder: 'Enter the name...',
      decoration: BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}