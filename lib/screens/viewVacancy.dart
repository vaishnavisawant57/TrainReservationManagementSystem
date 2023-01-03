import 'dart:convert';

import 'package:dbms_project/model/TrainFetchModel.dart';
import 'package:dbms_project/model/trainModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Widget createViewItem(TrainsFetch trains, BuildContext context) {
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
                "Train ID:",
                style: teSt1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                trains.TrainID.toString(),
                style: teSt2,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Seats Available:",
                style: teSt1,
              ),SizedBox(
                height: 10,
              ),
              Text(
                trains.NoOfSeats,
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
  final List<TrainsFetch> trains;

  CustomListView(this.trains);

  @override
  Widget build(context) {
    return createViewItem(trains[0], context);
  }}
class ViewVacancy extends StatelessWidget {
  final String TrainID;
  const ViewVacancy({Key? key, required this.TrainID}) : super(key: key);
  Future<List<TrainsFetch>> _downloadJSON(String trainid) async {
    final jsonEndpoint =
    Uri.parse('https://cheliform-ammonia.000webhostapp.com/checkVacancy.php');

    final response=await http.post(jsonEndpoint,body: {"TrainID":trainid});
    // print(response.body+"YES");
    if (response.statusCode == 200) {
      List trains = await json.decode((response.body));
      print(response.body+"YES");
      return trains.map((trains) => TrainsFetch.fromJson(trains)).toList();
    } else {
      throw Exception('We were not able to successfully download the json data.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/printTrainbackground.jpg'),
              fit: BoxFit.fill
            ),
          ),
        ),
      Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Ticket ID: ${TrainID}"),
        ),
        body: Center(
          child: FutureBuilder<List<TrainsFetch>>(
            future: _downloadJSON(TrainID),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<TrainsFetch> trains = snapshot.data;
                // print(trains[0].startPt.toString()+"homei");
                return new CustomListView(trains);
              }
              else if (snapshot.hasError) {
                // return Text('${snapshot.error} hello');
                print(snapshot.error);
              }
              return const CircularProgressIndicator();
            },
          ),

        )
    )]);
  }
}
