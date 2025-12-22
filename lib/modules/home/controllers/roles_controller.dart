import 'package:get/get.dart';

class RolesController extends GetxController {
  var showActionForm = false.obs;

  void toggleActionForm() {
    showActionForm.value = !showActionForm.value;
  }
}
