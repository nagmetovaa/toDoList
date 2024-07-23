import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/api_controller.dart';

class RandomQuotes extends StatefulWidget{

  @override
  _Random_QuotesState createState() => _Random_QuotesState();
}

class _Random_QuotesState extends State<RandomQuotes> {

  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 5, end: 100),
      duration: Duration(milliseconds: 1500),
      builder: (context, size, widget) {
        return Container(
          height: size,
          decoration: BoxDecoration(
            // color: Colors.teal[200]!,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0)
        ),
            boxShadow: [
              BoxShadow(
                color: Colors.teal[200]!.withOpacity(0.5),
                blurRadius: size,
                spreadRadius: size
              )
            ]
          ),
          child: Center(
            child: Obx(() {
              return ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Colors.blue, Colors.green, Colors.purple,Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  '${apiController.data}',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
              // return Text('${apiController.data}');
            }),
          ),
        );
      }
    );
  }
}