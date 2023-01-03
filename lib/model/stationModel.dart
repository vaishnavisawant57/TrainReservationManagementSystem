class Station {
  final String stationid;
  final String stationname;

  Station({
    required this.stationid,
    required this.stationname,
  });

  factory Station.fromJson(Map<String, dynamic> jsonData) {
    return Station(
      stationid: jsonData['stationid'] ?? '',
      stationname: jsonData['stationname'] ?? '',
    );
  }
}