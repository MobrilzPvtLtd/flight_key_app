import 'package:get/get.dart';
import '../../../data/models/my_fights_modal.dart';

class MyFlightsController extends GetxController {
  /// Selected date for filter
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  /// Flights list
  final RxList<FlightModel> flights = <FlightModel>[
    FlightModel(
      id: 1,
      flightNo: "332222",
      fromCode: "KINS",
      toCode: "KNEW",
      fromCity: "Indian Springs, NV",
      toCity: "New Orleans, LA",
      status: "READY 0000L",
      isReady: false,
      date: DateTime(2025, 12, 31),
    ),
    FlightModel(
      id: 1,
      flightNo: "N4896",
      fromCode: "KJFK",
      toCode: "EGLL",
      fromCity: "New York, NY",
      toCity: "London, UK",
      status: "READY 0632L",
      isReady: true,
      date: DateTime(2025, 12, 31),
    ),
  ].obs;

  /// Filter flights by selected date
  List<FlightModel> get filteredFlights {
    final d = selectedDate.value;

    return flights.where((flight) {
      return flight.date.year == d.year &&
          flight.date.month == d.month &&
          flight.date.day == d.day;
    }).toList();
  }

  /// Update date from calendar
  void changeDate(DateTime date) {
    selectedDate.value = date;
  }
}
