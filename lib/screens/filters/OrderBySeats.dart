import 'package:dbms_project/widgets/train_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'dart:async';
import '../../model/trainModel.dart';
class CustomListView extends StatelessWidget {
  final List<Trains> trains;

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

Future<List<Trains>> downloadJSON() async {
  final jsonEndpoint =
  Uri.parse('https://cheliform-ammonia.000webhostapp.com/OrderByNoOfSeats.php');

  final response = await get(jsonEndpoint);
  if (response.statusCode == 200) {
    List trains = await json.decode((response.body));
    print(response.body);
    return trains.map((trains) => Trains.fromJson(trains)).toList();
  } else {
    throw Exception('We were not able to successfully download the json data.');
  }
}
class OrderBySeats extends StatelessWidget {
  const OrderBySeats({Key? key}) : super(key: key);

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
              title: Text("All Trains (Seats: High to Low)"),
            ),
            body: Center(
              child: FutureBuilder<List<Trains>>(
                future: downloadJSON(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Trains> trains = snapshot.data;
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
        )
      ],
    );
  }
}
