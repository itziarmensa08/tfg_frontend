import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenRepository {

SplashScreenRepository();

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('id');
    await Future.delayed(const Duration(seconds: 2));
    if (userId != null) {
      return true;
    } else {
      return false;
    }    
  }
}