import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
class CancelTicket extends StatefulWidget {
  const CancelTicket({Key? key}) : super(key: key);

  @override
  State<CancelTicket> createState() => _CancelTicketState();
}

class _CancelTicketState extends State<CancelTicket> {
  var IDCon1=TextEditingController();
  // Future deletePass(String passID) async{
  //   var url=Uri.parse("https://cheliform-ammonia.000webhostapp.com/deletePass.php");
  //   http.post(url,body:{
  //     "PassID":passID
  //   });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Cancelling Ticket"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60,right: 30),
        child: ListView(
          children: [
            TextField(
              controller: IDCon1,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                icon: const Icon(Icons.train),
                labelText: 'Enter your Ticket ID',
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: ElevatedButton(
                      onPressed:(){
                        setState(() {
                          if(IDCon1.text!=''){
                            var url=Uri.parse("https://cheliform-ammonia.000webhostapp.com/deletePass.php");
                            http.post(url,body:{
                              "PassID":IDCon1.text,
                            });
                            var snackBar = SnackBar(content: Text(
                                'Ticket Cancelled!!'));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
                          }
                          else{
                            var snackBar = SnackBar(content: Text(
                                'Enter Ticket ID!!'));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
                          }
                        });
                      },
                      child: Text(
                        "Cancel Ticket",
                        style: TextStyle(
                            fontSize: 18
                        ),
                      )
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
