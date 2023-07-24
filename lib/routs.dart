import 'package:get/get.dart';

import 'Login _page.dart';

class Routerclass {
  static String Login = "/";

  static String gethomepageroute() => Login;

  static List<GetPage> routes = [
    GetPage(
      page: () => Loginpage(),
      name: Login,
    )
  ];
}
