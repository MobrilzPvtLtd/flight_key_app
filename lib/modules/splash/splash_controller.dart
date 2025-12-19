import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    // Decide where to go
    Get.offAllNamed(Routes.LOGIN);
    // or AppRoutes.home
  }
}
