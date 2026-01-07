class FlightModel {
  final int id;
  final String flightNo;
  final String fromCode;
  final String toCode;
  final String fromCity;
  final String toCity;
  final String status;
  final bool isReady;
  final DateTime date;

  FlightModel({
    required this.id,
    required this.flightNo,
    required this.fromCode,
    required this.toCode,
    required this.fromCity,
    required this.toCity,
    required this.status,
    required this.isReady,
    required this.date,
  });
}
