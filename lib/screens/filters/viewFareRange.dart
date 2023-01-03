import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dbms_project/model/TrainFetchModel.dart';
import 'package:flutter/material.dart';
import '../../widgets/TrainInfoFetch.dart';
class CustomListView extends StatelessWidget {
  final List<TrainsFetch> trains;

  CustomListView(this.trains);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: trains.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(trains[currentIndex], context);
      },
    );
  }}
Future<List<TrainsFetch>> _downloadJSON(String min,String max) async {
  final jsonEndpoint =
  Uri.parse('https://cheliform-ammonia.000webhostapp.com/FareRange.php');

  final response=await http.post(jsonEndpoint,body: {"min":min,"max":max});
  // print(response.body+"YES");
  if (response.statusCode == 200) {
    List trains = await json.decode((response.body));
    print(response.body+"YES");
    return trains.map((trains) => TrainsFetch.fromJson(trains)).toList();
  } else {
    throw Exception('We were not able to successfully download the json data.');
  }
}

class ViewFareRange extends StatelessWidget {
  final String min;
  final String max;
  const ViewFareRange({Key? key, required this.min, required this.max}) : super(key: key);

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Filtered Trains"),
        ),
        body: Center(
          child: FutureBuilder<List<TrainsFetch>>(
            future: _downloadJSON(min,max),
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
