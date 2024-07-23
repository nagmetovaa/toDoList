import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<void> init() async {
  }

  Future<Response> getQuote(String link) async {
    final response  = await get(link);
    if (response.statusCode == 200) {
      return response;
    }else {
      throw Exception('Something gets wrong!');
    }
  }
}