class AircraftFleet {
  String tailNumber;

  AircraftFleet({this.tailNumber = ''});

  Map<String, dynamic> toJson() {
    return {
      'tailNumber': tailNumber,
    };
  }

  factory AircraftFleet.fromJson(Map<String, dynamic> json) {
    return AircraftFleet(
      tailNumber: json['tailNumber'] ?? '',
    );
  }
}
