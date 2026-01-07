import 'package:get/get.dart';

import '../controllers/flight_detail_controller.dart';

class FlightDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final flightId = Get.parameters['flightId']!;
    Get.lazyPut<FlightDetailsController>(
          () => FlightDetailsController(),
    );
  }
}
