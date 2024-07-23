import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'create_window.dart';

class AddButton extends StatelessWidget {

  final String name;
  final String profile_name;

  const AddButton({
    super.key,
    required this.name,
    required this.profile_name
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        CreateWindow().showInputDialog(context, profile_name, name);
      },
      child: Icon(
        Icons.add_circle,
      color: Colors.green,
      size: 50.0,),
    );
  }

}