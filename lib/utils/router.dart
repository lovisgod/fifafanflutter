import 'package:fifafanmobile/screens/home_page.dart';
import 'package:fifafanmobile/screens/login.dart';
import 'package:fifafanmobile/screens/sign_up.dart';
import 'package:fifafanmobile/screens/splash_screen.dart';
import 'package:get/get.dart';

class Router {
  static final route = [
    GetPage(
      name: '/splash',
      page: () => FifaFanSplashScreen(),
    ),
    GetPage(
      name: '/homePage',
      page: () => Homepage(),
    ),
    GetPage(
      name: '/auth/login',
      page: () => Login(),
    ),
    GetPage(
      name: '/auth/sign_up',
      page: () => SignUp(),
    )
  ];
}
