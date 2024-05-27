import 'package:get/get.dart';
import 'package:medika/app/modules/drMeet/bindings/drMeet_binding.dart';
import 'package:medika/app/modules/drMeet/views/drMeetPayement.dart';
import 'package:medika/app/modules/drMeet/views/drMeet_view.dart';

import '../modules/drMeet/views/drMeetDetail.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onborading/bindings/onborading_binding.dart';
import '../modules/onborading/views/onborading_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DrMEETPAYEMENT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBORADING,
      page: () => const OnboradingView(),
      binding: OnboradingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DrMEET,
      page: () => const DrMEETtView(),
      binding: DrMEETBinding(),
    ),
    GetPage(
      name: _Paths.DrMEETDETAILS,
      page: () => DrMeetDetail(),
      binding: DrMEETBinding(),
    ),
    GetPage(
      name: _Paths.DrMEETPAYEMENT,
      page: () => const DrMeetPayement(),
      binding: DrMEETBinding(),
    ),
  ];
}
