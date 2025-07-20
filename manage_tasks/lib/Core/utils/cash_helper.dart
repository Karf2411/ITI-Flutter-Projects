import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<dynamic> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
  }

  static Future<dynamic> getData({required String key}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  static dynamic getDataSync({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
