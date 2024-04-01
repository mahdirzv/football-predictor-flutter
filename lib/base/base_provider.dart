
import 'package:get/get.dart';

class BaseProvider extends GetConnect {

  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.example.com';
  }
}