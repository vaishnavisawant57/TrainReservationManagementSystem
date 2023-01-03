class Trains {
  final String trainid;
  final String trainname;
  final String fare;
  final String source;
  final String sourceName;
  final String dest;
  final String destName;
  final String seats;

  Trains({
    required this.trainid,
    required this.trainname,
    required this.fare,
    required this.source,
    required this.sourceName,
    required this.dest,
    required this.destName,
    required this.seats,
  });

  factory Trains.fromJson(Map<String, dynamic> jsonData) {
    return Trains(
      trainid: jsonData['trainid'] ?? '',
      trainname: jsonData['trainname'] ?? '',
      fare: jsonData['fare'] ?? '',
      source: jsonData['source'] ?? '',
      sourceName: jsonData['sourceName'] ?? '',
      dest: jsonData['dest'] ?? '',
      destName: jsonData['destName'] ?? '',
      seats: jsonData['seats'] ?? '',
    );
  }
}