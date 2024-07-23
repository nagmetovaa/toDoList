import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/shared_preference_controller.dart';
import '../pages/tasks.dart';
import 'package:get/get.dart';

import 'confirmation_dialog.dart';

class ProfilesListView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final SharedPreferenceController sharedPreferenceController = Get.find();
    return Obx(() {
      return ListView.builder(
        itemCount: sharedPreferenceController.profiles.length,
        itemBuilder: (context,index) {
          final profile = sharedPreferenceController.profiles[index];
          return Dismissible(
              key: Key(profile),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete, color: Colors.grey[100]),
            ),
            confirmDismiss: (direction) async {
              return await ConfirmationDialog().showConfirmationDialog(context, 'profile', profile);
            },
            onDismissed: (direction) {
              sharedPreferenceController.removeProfile(profile);
              Get.snackbar('Profile Deleted', 'The profile "$profile" was deleted successfully.');
            },
              child: ListTile(
                title: Text(profile),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => Tasks(profile_name: profile,)),
                  );
                },
              ),
          );
        }
      );
    });

  }
}