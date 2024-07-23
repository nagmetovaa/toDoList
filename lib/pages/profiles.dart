import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/widgets/add_button.dart';
import '../widgets/profiles_list_view.dart';
import '../widgets/random_quotes.dart';

class Profiles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profiles'),
      ),
      body: Container(
        color: Colors.grey[100],
        width: ScreenUtil().setWidth(360),
        height: ScreenUtil().setHeight(690),
        child: Column(
          children: [
            Expanded(
              child: ProfilesListView(),
            ),
            RandomQuotes(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: AddButton(name: 'profile', profile_name: '',),
              ),
            ),
          ],
        ),
      )
    );
  }
}