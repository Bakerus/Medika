import 'package:get/get.dart';
import 'package:medika/app/modules/pharmax/views/pharmax_viewPrincipal.dart';

import '../modules/drMeet/bindings/drMeet_binding.dart';
import '../modules/drMeet/views/drMeetDetail.dart';
import '../modules/Edukate/bindings/edukate_binding.dart';
import '../modules/Edukate/views/edukate_view.dart';
import '../modules/drMeet/views/drMeetPayement.dart';
import '../modules/drMeet/views/drMeet_view.dart';
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
import '../modules/traitement/bindings/traitement_binding.dart';
import '../modules/traitement/views/traitement_view.dart';
import '../modules/traitement/views/traitement_à_suivre.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TRAITEMENT;

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
    GetPage(
      name: _Paths.PHARMAX,
      page: () => const PharmaXPrincipal(),
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
    GetPage(
      name: _Paths.EDUKATE,
      page: () => const EdukateView(),
      binding: EdukateBinding(),
    ),
    GetPage(
      name: _Paths.TRAITEMENT,
      page: () => const TraitementView(),
      binding: TraitementBinding(),
    ),
  ];
}
