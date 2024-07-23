import 'dart:async';
import 'package:get/get.dart';
import '../services/api_service.dart';

class ApiController extends GetxController{
  var data = ''.obs;
  final ApiService _apiService = Get.find();
  Timer? _timer;


  @override
  void onInit() {
    super.onInit();
    loadQuote();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      loadQuote();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
  Future<void> loadQuote() async {
    try {
      final response = await _apiService.getQuote(
          'https://api.breakingbadquotes.xyz/v1/quotes');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
      } else {
        var list = response.body as List<dynamic>;
        var quotes = list[0];
        var quote = quotes['quote'];
        if (quote is String) {
          data.value = quote;
        }
      }
    }catch (e) {
      print('Exception: $e');
    }
  }



}