import 'package:dbms_project/model/stationModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'dart:async';
class StationCNT {
  // final String stationid;
  final String stationname;
  final String count;

  StationCNT({
    // required this.stationid,
    required this.count,
    required this.stationname,
  });

  factory StationCNT.fromJson(Map<String, dynamic> jsonData) {
    return StationCNT(
      // stationid: jsonData['stationid'] ?? '',
      stationname: jsonData['stName'] ?? '',
      count: jsonData['count'] ?? '',
    );
  }
}
Widget createViewStation(StationCNT station, BuildContext context) {
  // var textSt=TextStyle(
  //     fontSize: 21,
  //     // color: Color(0xffE5E3C9)
  //     color: Colors.white
  // );
  return Padding(
    padding: EdgeInsets.only(top: 15,right: 15,left: 15),
    child: Container(
      // height: 280,
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
                Color(0xff94B49F),
                Color(0xffB4CFB0),
                Color(0xff789395),
              ],
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       station.stationname.toString(),
                        // "Jhelum Express",
                        style: TextStyle(
                            fontSize: 21,
                            // color: Color(0xffE5E3C9)
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat Regular'
                        ),
                      ),
                      Text(

                        station.count.toString(),
                        // "2021",
                        style: TextStyle(
                            fontSize: 21,
                            // color: Color(0xffE5E3C9)
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat Regular'
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
class CustomListView extends StatelessWidget {
  final List<StationCNT> stationcnt;

  CustomListView(this.stationcnt);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: stationcnt.length,
      itemBuilder: (context, int currentIndex) {
        return createViewStation(stationcnt[currentIndex], context);
      },
    );
  }}

Future<List<StationCNT>> downloadJSON() async {
  final jsonEndpoint =
  Uri.parse('https://cheliform-ammonia.000webhostapp.com/GroupByStID.php');

  final response = await get(jsonEndpoint);
  if (response.statusCode == 200) {
    List stationcnt = await json.decode((response.body));
    return stationcnt.map((stationcnt) => StationCNT.fromJson(stationcnt)).toList();
  } else {
    throw Exception('We were not able to successfully download the json data.');
  }
}
class GroupBySource extends StatelessWidget {
  const GroupBySource({Key? key}) : super(key: key);

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
              title: Text("Group By Source"),
            ),
            body: Center(
              child: FutureBuilder<List<StationCNT>>(
                future: downloadJSON(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<StationCNT> station = snapshot.data;
                    // print(trains[0].startPt.toString()+"homei");
                    return new CustomListView(station);
                  }
                  else if (snapshot.hasError) {
                    // return Text('${snapshot.error} hello');
                    print(snapshot.error);
                  }
                  return const CircularProgressIndicator();
                },
              ),

            )
        )
      ],
    );
  }
}
