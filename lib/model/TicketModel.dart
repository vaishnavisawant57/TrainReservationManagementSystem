class TicketModel {
  final String PassID;
  final String PassName;
  final String DoB;
  final String sourceName;
  final String destName;
  final String Gender;
  final String TrainID;
  final String SeatNo;
  final String Day;

  TicketModel({
    required this.PassID,
    required this.PassName,
    required this.DoB,
    required this.sourceName,
    required this.destName,
    required this.Gender,
    required this.TrainID,
    required this.SeatNo,
    required this.Day,
  });

  factory TicketModel.fromJson(Map<String, dynamic> jsonData) {
    return TicketModel(
      PassID: jsonData['PassID'] ?? '',
      PassName: jsonData['PassName'] ?? '',
      DoB: jsonData['DoB'] ?? '',
      sourceName: jsonData['sourceName'] ?? '',
      destName: jsonData['destName'] ?? '',
      Gender: jsonData['Gender'] ?? '',
      TrainID: jsonData['TrainID'] ?? '',
      SeatNo: jsonData['SeatNo'] ?? '',
      Day: jsonData['Day'] ?? '',
    );
  }
}