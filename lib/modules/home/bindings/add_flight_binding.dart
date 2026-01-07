import 'package:get/get.dart';

import '../controllers/add_flight_Controller.dart';

class AddFlightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFlightController>(() => AddFlightController());
  }
}
