class TrainsFetch {
  final String TrainID;
  final String TrainName;
  final String Fare;
  final String Source;
  final String Dest;
  final String NoOfSeats;

  TrainsFetch({
    required this.TrainID,
    required this.TrainName,
    required this.Fare,
    required this.Source,
    required this.Dest,
    required this.NoOfSeats,
  });

  factory TrainsFetch.fromJson(Map<String, dynamic> jsonData) {
    return TrainsFetch(
      TrainID: jsonData['TrainID'] ?? '',
      TrainName: jsonData['TrainName'] ?? '',
      Fare: jsonData['Fare'] ?? '',
      Source: jsonData['Source'] ?? '',
      Dest: jsonData['Dest'] ?? '',
      NoOfSeats: jsonData['NoOfSeats'] ?? '',
    );
  }
}