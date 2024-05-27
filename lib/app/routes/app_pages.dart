import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onborading/bindings/onborading_binding.dart';
import '../modules/onborading/views/onborading_view.dart';
import '../modules/pharmax/bindings/pharmax_binding.dart';
import '../modules/pharmax/views/pharmax_view.dart';
import '../modules/signupPatient/bindings/signup_patient_binding.dart';
import '../modules/signupPatient/views/signup_patient_view.dart';
import '../modules/signupProfessionnel/bindings/signup_professionnel_binding.dart';
import '../modules/signupProfessionnel/views/signup_professionnel_view.dart';
import '../modules/signupProfessionnel/views/signup_professionnel_view_2.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNUP_PROFESSIONNEL;

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
      name: _Paths.PHARMAX,
      page: () => const PharmaxView(),
      binding: PharmaxBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_PROFESSIONNEL,
      page: () => const SignupProfessionnelView(),
      binding: SignupProfessionnelBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_PATIENT,
      page: () => const SignupPatientView(),
      binding: SignupPatientBinding(),
    ),
  ];
}
