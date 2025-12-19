import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() {
    // Check if user is logged in
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      // API call
      await Future.delayed(Duration(seconds: 2)); // Simulate API
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }
}