import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class BookATicket extends StatefulWidget {
  const BookATicket({Key? key}) : super(key: key);

  @override
  State<BookATicket> createState() => _BookATicketState();
}

class _BookATicketState extends State<BookATicket> {
  var _currentSelectedValueG;
  var _gender = [
    "Male",
    "Female",
    "Other"
  ];
  var _currentSelectedValueD;
  var _day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  var st=TextStyle(
      color: Colors.white
  );

  final nameCon=TextEditingController();
  final trainidCon=TextEditingController();
  final DOBCon=TextEditingController();

   Future enterPassenger() async {
    //getting values from controllers
    String name = nameCon.text;
    String dob = DOBCon.text;
    String trainid = trainidCon.text;
    String gender = _currentSelectedValueG;
    String day = _currentSelectedValueD;

    var url = Uri.parse('https://cheliform-ammonia.000webhostapp.com/addPassenger.php');
    var data = {
      'PassName': name,
      'DOB': dob,
      'TrainID': trainid,
      'Gender': gender,
      'Day': day,
      'Source': 1001,
      'Dest': 1003,
    };
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);
    print(message+"hii");
    var snackBar;
    if(message=="Passenger Added"){
      snackBar = SnackBar(content: Text(
          'Ticket Booked!!'));
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar);
    }
    else{
      snackBar = SnackBar(content: Text(
          'Wrong Input'));
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(
        "Book Ticket"
      ),
    ),
    body: Padding(
      padding: EdgeInsets.only(top: 20,right: 20),
      child: ListView(
        children: [
          TextField(
            controller: nameCon,
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              labelText: 'Name',
              labelStyle: TextStyle(
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 39,top: 20),
            child: TextField(
              controller: DOBCon,
              decoration: InputDecoration(
                // border: InputBorder.,
                labelText: 'Date of Birth (YYYY-MM-DD)',
                hintStyle: TextStyle(

                ),
                hintText: '(YYYY-MM-DD)',
                labelStyle: TextStyle(

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 39,top: 40,right: 30),
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText: "Gender",
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: _currentSelectedValueG == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _currentSelectedValueG,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentSelectedValueG = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: _gender.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              icon: const Icon(Icons.train),
              labelText: 'Train Number',
            ),
            controller: trainidCon,
          ),
          Padding(
            padding: EdgeInsets.only(left: 39,top: 40,right: 30),
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText: "Day of Travelling",
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: _currentSelectedValueD == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _currentSelectedValueD,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentSelectedValueD = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: _day.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: ElevatedButton(
                    onPressed:(){
                      enterPassenger();
                    },
                    child: Text(
                      "Book The Ticket",
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

