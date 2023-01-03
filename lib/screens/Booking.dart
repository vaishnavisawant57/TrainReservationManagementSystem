import 'dart:convert';
import 'package:dbms_project/model/TicketModel.dart';
import 'package:dbms_project/screens/Ticket.dart';
import 'package:dbms_project/screens/showTicketButton.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/TrainFetchModel.dart';
class Booking extends StatefulWidget {
  final String trainID;
  final String trainname;
  final String source;
  final String dest;
  const Booking({Key? key, required this.trainID, required this.source, required this.dest, required this.trainname}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}
// Widget dayList(var data){ //widget function for city list
//   List<Day> dayList = List<Day>.from(
//       data["data"].map((i){
//         return Day.fromJSON(i);
//       })
//   ); //searilize citylist json data to object model.
//
//   return DropdownButton(
//       hint: Text("Select City"),
//       isExpanded: true,
//       items: dayList.map((cityOne){
//         return DropdownMenuItem(
//           child: Text(cityOne.day1),
//           value: cityOne.day1,
//         );
//       }).toList(),
//       onChanged: (value){
//         print("Selected city is $value");
//       }
//   );
// }
// class Day{
//   late String  TrainID, day1;
//   Day({required this.TrainID, required this.day1});
//
//   factory Day.fromJSON(Map<String, dynamic> json){
//     return Day(
//         TrainID: json["TrainID"],
//         day1: json["Day"]
//     );
//   }
// }
class _BookingState extends State<Booking>{
  String message="";
  bool error=false;
  var data;

  Future<void> getDay() async {
    final jsonEndpoint = Uri.parse("https://cheliform-ammonia.000webhostapp.com/day_list.php");
    final response=await http.post(jsonEndpoint,body: {"TrainID":widget.trainID.toString()});
    //attache countryname on parameter country in url
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        if(data["error"]){
          //check fi there is any error from server.
          error = true;
          message = data["errmsg"];
        }
      });
      return data;
      // );
    }else{
      //there is error
      setState(() {
        error = true;
        message = "Error during fetching data";
      });
    }
  }

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
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
  final DOBCon=TextEditingController();


  Future enterPassenger() async {
    //getting values from controllers
    String name = nameCon.text;
    String dob = DOBCon.text;
    String gender = _currentSelectedValueG;
    String day = _currentSelectedValueD;

    var url = Uri.parse('https://cheliform-ammonia.000webhostapp.com/addPassenger.php');
    var data = {
      'PassName': name,
      'DOB': dob,
      // 'TrainID': 2027,
      'TrainID': widget.trainID.toString(),
      'Gender': gender,
      'Day': day,
      // 'Source':1004,
      'Source': int.parse(widget.source),
      // 'Dest': 1007,
      'Dest': int.parse(widget.dest)
    };
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);
    print(message+"hii");
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
        padding: EdgeInsets.only(top: 20,right: 20,left: 10),
        child: ListView(
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.trainname,
              // "Jhelum Express",
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat Regular'
              ),
            ),
            Text(
              widget.trainID,
              // "2021",
              style: TextStyle(
                  fontSize: 21,
                  // color: Color(0xffE5E3C9)
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat Regular'
              ),
            ),
          ],
        ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Text(
                  "Source: ${widget.source}",
                  // "Starts from: Pune",
                  style: TextStyle(
                      fontSize: 21,
                      // color: Color(0xffE5E3C9)
                      color: Colors.black,
                      fontFamily: 'Montserrat Regular'
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Text(
                  "Destination: ${widget.dest}",
                  // "Destination: Jammu Tawi",
                  style: TextStyle(
                      fontSize: 21,
                      // color: Color(0xffE5E3C9)
                      color: Colors.black,
                      fontFamily: 'Montserrat Regular'
                  ),
                ),
              ),
            ),
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
                        if(_currentSelectedValueD!='' && _currentSelectedValueD!='' && nameCon.text!='' && DOBCon.text!=''){
                          enterPassenger();
                          var snackBar = SnackBar(content: Text(
                              'Ticket Booked!!'));
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowTicketButton(name:nameCon.text,dob:DOBCon.text,source:{widget.source}.toString(),dest:{widget.dest}.toString(),gender: _currentSelectedValueG,trainid: {widget.trainID}.toString(),day: _currentSelectedValueD,)));
                        }
                       else{
                          var snackBar = SnackBar(content: Text(
                              'Enter the Inputs!'));
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar);
                        }
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

