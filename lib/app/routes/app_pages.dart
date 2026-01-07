import 'package:flight_key_app/modules/auth/views/login_view.dart';
import 'package:flight_key_app/modules/auth/views/register_view.dart';
import 'package:flight_key_app/modules/home/bindings/add_flight_binding.dart';
import 'package:flight_key_app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/home/bindings/flight_details_binding.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/bindings/payment_info_binding.dart';
import '../../modules/home/tabs/add_flight.dart';
import '../../modules/home/views/my_flights_detail_screen.dart';
import '../../modules/home/views/price_info_screen.dart';
import '../../modules/home/views/terms&condition_screen.dart';
import '../../modules/home/views/user_profile_screen.dart';
import '../../modules/splash/splash_binding.dart';
import '../../modules/splash/splash_view.dart';
import '../bindings/profile_binding.dart';
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
    GetPage(
      name: Routes.ADDFLIGHT,
      page: () =>  AddFlightScreen(),
      binding: AddFlightBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.FlightDetails,
      page: () =>  FlightDetailsScreen(),
      binding: FlightDetailsBinding(),
    ),
    GetPage(
      name: Routes.TERMS,
      page: () => const TermsConditionsView(),
    ),
    GetPage(
      name: Routes.PAYEMENT,
      page: () => const PaymentInfoScreen(),
      binding: PaymentInfoBinding(),
    ),
  ];
}
