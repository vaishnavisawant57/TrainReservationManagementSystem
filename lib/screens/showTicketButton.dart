import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/TicketModel.dart';
import 'package:http/http.dart' as http;

import 'Ticket.dart';
class ShowTicketButton extends StatelessWidget {
  final String name;
  final String dob;
  final String source;
  final String dest;
  final String gender;
  final String trainid;
  final String day;



  const ShowTicketButton({Key? key, required this.name, required this.dob, required this.source, required this.dest, required this.gender, required this.trainid, required this.day}) : super(key: key);
  Future<List<TicketModel>> _downloadJSON(String passname,String dob,String source,String dest,String gender,String trainid,String day) async {
    final jsonEndpoint =
    Uri.parse('https://cheliform-ammonia.000webhostapp.com/getTicketID.php');

    final response=await http.post(jsonEndpoint,body: {"PassName":passname,"DOB":dob,"Source":source,"Dest":dest,"Gender":gender,"TrainID":trainid,"Day":day,});
    // print(response.body+"YES");
    if (response.statusCode == 200) {
      List ticket = await json.decode((response.body));
      // print(response.body+"YES");
      return ticket.map((ticket) => TicketModel.fromJson(ticket)).toList();
    } else {
      throw Exception('We were not able to successfully download the json data.');
    }
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<TicketModel>>(
        future: _downloadJSON(name, dob, source, dest, gender, trainid, day),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<TicketModel> ticket = snapshot.data;
            print(ticket[0].PassID.toString()+"HYEL");
            return Ticket(TicketID: ticket[0].PassID.toString(),);
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Ticket(TicketID: '56',)));
          }
          else if (snapshot.hasError) {
            // return Text('${snapshot.error} hello');
            print(snapshot.error);
          }
          return const CircularProgressIndicator();
        },
      )
    );
  }
}
