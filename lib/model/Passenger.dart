class Passenger {
  final String passid;
  final String passname;
  final String dob;
  final String source;
  final String dest;
  final String gender;
  final String trainid;
  final String seatno;
  final String day;

  Passenger({
    required this.passid,
    required this.passname,
    required this.dob,
    required this.source,
    required this.dest,
    required this.gender,
    required this.trainid,
    required this.seatno,
    required this.day,
  });

  factory Passenger.fromJson(Map<String, dynamic> jsonData) {
    return Passenger(
      passid: jsonData['passid'] ?? '',
      passname: jsonData['passname'] ?? '',
      dob: jsonData['dob'] ?? '',
      source: jsonData['source'] ?? '',
      dest: jsonData['dest'] ?? '',
      gender: jsonData['gender'] ?? '',
      trainid: jsonData['trainid'] ?? '',
      seatno: jsonData['SeatNo'] ?? '',
      day: jsonData['day'] ?? '',
    );
  }
}