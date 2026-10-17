import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveData(String username) async {
    final prefs = await SharedPreferences.getInstance();

    // print("Hafızaya yazılan değer: $username");

    await prefs.setString("ls_name", username);
  }

  Future<String> getData() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("ls_name") ?? "";
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("ls_name");
  }
}