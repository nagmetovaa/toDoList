import 'package:flutter/material.dart';
import 'package:todo_list/pages/profiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/services/api_service.dart';
import 'package:todo_list/services/shared_preference_service.dart';
import 'controller/shared_preference_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async {
    final service = SharedPreferenceService();
    await service.init();
    return service;
  });

  await Get.putAsync(() async {
    final service = ApiService();
    await service.init();
    return service;
  });


  Get.put(SharedPreferenceController());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, _) => GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Builder(
            builder: (context) {
              return Profiles();
            }
          )
      ),
    );
  }
}
