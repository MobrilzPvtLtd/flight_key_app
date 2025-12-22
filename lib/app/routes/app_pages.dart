import 'package:flight_key_app/modules/auth/views/login_view.dart';
import 'package:flight_key_app/modules/auth/views/register_view.dart';
import 'package:flight_key_app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/splash/splash_binding.dart';
import '../../modules/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegistrationScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
