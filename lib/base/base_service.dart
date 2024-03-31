
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseService extends GetxController {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final logger = Logger();

  Future setStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future setBoolValue(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool?> getBoolValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<bool> removeStoredValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  clearSecureStorage() {
    secureStorage.deleteAll();
  }

  Future setSecureValue(String key, String? object) async {
    await secureStorage.write(key: key, value: object);
  }

  Future<String?> getSecureValue(String key) async {
    return await secureStorage.read(key: key);
  }
}