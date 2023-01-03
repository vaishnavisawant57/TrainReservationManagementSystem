import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Ticket.dart';
class ViewTicket extends StatefulWidget {
  const ViewTicket({Key? key}) : super(key: key);

  @override
  State<ViewTicket> createState() => _ViewTicketState();
}

class _ViewTicketState extends State<ViewTicket> {
  var IDCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "View Ticket"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60,right: 30),
        child: ListView(
          children: [
            TextField(
              controller: IDCon,
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
                        if(IDCon.text!=''){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Ticket(TicketID: IDCon.text,)));
                        }
                        else{
                          var snackBar = SnackBar(content: Text(
                              'Enter Ticket ID!!!!'));
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar);
                        }
                      },
                      child: Text(
                        "View Ticket",
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
