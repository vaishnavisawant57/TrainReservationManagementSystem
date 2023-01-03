import 'dart:convert';
import 'dart:async';
// import 'dart:core';
import 'package:dbms_project/model/stationModel.dart';
import 'package:dbms_project/model/trainModel.dart';
import 'package:dbms_project/screens/viewSearchTrains.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/TrainFetchModel.dart';

class SearchTrainPage extends StatefulWidget {
  const SearchTrainPage({Key? key}) : super(key: key);

  @override
  _SearchTrainState createState() => _SearchTrainState();
}

class _SearchTrainState extends State<SearchTrainPage> {
  @override
  void initState(){
    super.initState();

  }
  late final List<Trains> trains1;
  var _currentSelectedValue1;
  var _currentSelectedValue2;
  var _station=[
    'Pune',
    'Jammu Tawi',
    'Delhi',
    'Bhatinda',
    'Amritsar',
    'Chandigarh',
    'Mumbai Central',
    'Puri',
    'Kolkata',
    'Bangalore',
    'Chennai',
    'Kudal',
    'Bhopal',
    'Dehradun',
    'Howrah ',
    'Jaipur',
    'Kota',
    'Patna',
    'Agra',
    'Ambala'
  ];
  bool showWidget = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Search Trains"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60,right: 30),
        child: ListView(
          children: [
            // TextField(
            //   // controller: fromCon,
            //   decoration: const InputDecoration(
            //     icon: const Icon(Icons.train),
            //     labelText: 'From Station',
            //   ),
            // ),
            // TextField(
            //   // controller: toCon,
            //   decoration: const InputDecoration(
            //     icon: const Icon(Icons.train),
            //     labelText: 'To Station',
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 39,top: 40,right: 30),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        labelText: "From",
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),

                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      icon: Icon(Icons.train)
                    ),
                    isEmpty: _currentSelectedValue1 == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue1,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            _currentSelectedValue1 = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: _station.map((String value) {
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
                        labelText: "To",
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),

                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        icon: Icon(Icons.train)
                    ),
                    isEmpty: _currentSelectedValue2 == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue2,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            _currentSelectedValue2 = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: _station.map((String value) {
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
                    onPressed:() async {
                      if(_currentSelectedValue1!=null && _currentSelectedValue2!=null){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewSearchTrains(Source: _currentSelectedValue1, Dest: _currentSelectedValue2)));
                      }
                      else{
                        var snackBar = SnackBar(content: Text(
                            'Enter the inputs!!'));
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar);
                      }
                    },
                    child: Text(
                      "Show Trains",
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

// $json = file_get_contents('php://input');
// $obj = json_decode($json,true);
// $source = $obj['Source'];
// $dest = $obj['Dest'];
// $SQL_SELECT_ALL="select * from Train where Source=(select StationID from Station where StationName='$source') and Dest=(select StationID from Station where StationName='$dest')";
