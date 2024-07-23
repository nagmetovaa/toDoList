import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog {
  Future<bool?> showConfirmationDialog(BuildContext context, String title, String name) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete',style: TextStyle(color: Colors.green[900])),
          content: Text('Are you sure you want to delete $title named "$name"?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.green[900]),),
              onPressed: () {
                Get.back(result: false);
              },
            ),
            TextButton(
              child: Text('Delete', style: TextStyle(color: Colors.green[900])),
              onPressed: () {
                Get.back(result: true);
              },
            ),
          ],
        );
      },
    );
  }

}