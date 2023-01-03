import 'package:dbms_project/model/TicketModel.dart';
import 'package:flutter/material.dart';
import '../model/Passenger.dart';
import 'package:dbms_project/model/Passenger.dart';
import 'package:http/http.dart' show get;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
Widget createViewItem(TicketModel passenger, BuildContext context) {
// Widget createViewItem(BuildContext context) {
  var teSt1=TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat Regular',
      color: Colors.black,
      fontWeight: FontWeight.bold
  );
  var teSt2=TextStyle(
    fontSize: 20,
    fontFamily: 'Montserrat Regular',
    color: Colors.black,
    // fontWeight: FontWeight.bold
  );
  return Padding(
    padding: EdgeInsets.only(top: 30,bottom: 30,right: 20,left: 20),
    child: Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffE5E3C9),
              Color(0xff789395),
              Color(0xffB4CFB0),
              Color(0xff94B49F),
            ],
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 20),
          child: ListView(
            children: [
              Text(
                "Passenger Name:",
                style: teSt1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                passenger.PassName.toString(),
                style: teSt2,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "DOB:",
                style: teSt1,
              ),SizedBox(
                height: 10,
              ),
              Text(
                passenger.DoB,
                style: teSt2,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Gender:",
                style: teSt1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                passenger.Gender,
                style: teSt2,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Source:",
                style: teSt1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                passenger.sourceName,
                style: teSt2,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Destination:",
                style: teSt1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                passenger.destName,
                style: teSt2,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "TrainID:",
                style: teSt1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                passenger.TrainID,
                style: teSt2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Seat Number:",
                style: teSt1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                passenger.SeatNo,
                style: teSt2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Day:",
                style: teSt1,
              ),SizedBox(
                height: 10,
              ),
              Text(
                passenger.Day,
                style: teSt2,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
class CustomListView extends StatelessWidget {
  final List<TicketModel> passenger;

  CustomListView(this.passenger);

  @override
  Widget build(context) {
   return createViewItem(passenger[0], context);
  }}
Future<List<TicketModel>> _downloadJSON(String passID) async {
  final jsonEndpoint =
  Uri.parse('https://cheliform-ammonia.000webhostapp.com/ViewTicket.php');

  final response=await http.post(jsonEndpoint,body: {"PassID":passID});
  // print(response.body+"YES");
  if (response.statusCode == 200) {
    List passenger = await json.decode((response.body));
    print(response.body+"YES");
    return passenger.map((passenger) => TicketModel.fromJson(passenger)).toList();
  } else {
    throw Exception('We were not able to successfully download the json data.');
  }
}
class Ticket extends StatelessWidget {
  final String TicketID;
  const Ticket({Key? key, required this.TicketID}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
            Container(
            // child: Image(image: AssetImage('assets/images/printTrainbackground.jpg')),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/printTrainbackground.jpg'),
                  fit: BoxFit.fill
                  ),
              ),
            ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Ticket ID: ${TicketID}"),
        ),
        body: Center(
          child: FutureBuilder<List<TicketModel>>(
            future: _downloadJSON(TicketID),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<TicketModel> passenger = snapshot.data;
                // print(trains[0].startPt.toString()+"homei");
                return new CustomListView(passenger);
              }
              else if (snapshot.hasError) {
                // return Text('${snapshot.error} hello');
                print(snapshot.error);
              }
              return const CircularProgressIndicator();
            },
          ),

        )
    )]
    );}
}

