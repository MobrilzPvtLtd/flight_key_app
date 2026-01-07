import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    print('SplashController onReady called');

    Future.delayed(const Duration(seconds: 2), () {
      print('Navigating to Register');
      Get.offNamed(Routes.LOGIN);
    });
  }
}