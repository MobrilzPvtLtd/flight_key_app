import 'package:get/get.dart';

class FlightAction {
  final String title;
  final String assignedTo;
  bool completed;
  DateTime? completedAt;

  FlightAction({
    required this.title,
    required this.assignedTo,
    this.completed = false,
    this.completedAt,
  });
}

class FlightDetailsController extends GetxController {
  final actions = <FlightAction>[
    FlightAction(title: "Crew brief sent", assignedTo: "Kumar Kumar"),
    FlightAction(title: "Overflights granted", assignedTo: "Kumar Kumar"),
    FlightAction(title: "Arrival slot granted", assignedTo: "Kumar Kumar"),
    FlightAction(title: "Customs filed", assignedTo: "Kumar Kumar"),
    FlightAction(title: "Fuel release sent", assignedTo: "Kumar Kumar"),
  ].obs;

  void toggleAction(int index) {
    actions[index].completed = !actions[index].completed;
    actions[index].completedAt =
    actions[index].completed ? DateTime.now() : null;
    actions.refresh();
  }
}
