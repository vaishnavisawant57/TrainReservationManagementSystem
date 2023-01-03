import 'package:flutter/material.dart';

import '../model/TrainFetchModel.dart';
import '../screens/Booking.dart';
Widget createViewItem(TrainsFetch trains, BuildContext context) {
// Widget createViewItem(BuildContext context) {
  var textSt=TextStyle(
      fontSize: 21,
      // color: Color(0xffE5E3C9)
      color: Colors.black
  );
  return Padding(
    padding: EdgeInsets.only(top: 15,right: 15,left: 15),
    child: FlatButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Booking(trainID: trains.TrainID, source: trains.Source, dest: trains.Dest, trainname:trains.TrainName,)));
      },
      child: Container(
        height: 280,
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
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          trains.TrainName.toString(),
                          // "Jhelum Express",
                          style: TextStyle(
                              fontSize: 21,
                              // color: Color(0xffE5E3C9)
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(

                          trains.TrainID.toString(),
                          // "2021",
                          style: TextStyle(
                              fontSize: 21,
                              // color: Color(0xffE5E3C9)
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 10,top: 40,bottom: 10),
                      child: Text(
                        "Fare: ${trains.Fare.toString()}",
                        // "Fare: 2000",
                        style: textSt,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                      child: Text(
                        "Number of Seats Available: ${trains.NoOfSeats.toString()}",
                        // "Number of Seats: 200",/
                        style: textSt,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                      child: Text(
                        "Starts from: ${trains.Source.toString()}",
                        // "Starts from: Pune",
                        style: textSt,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                      child: Text(
                        "Destination: ${trains.Dest.toString()}",
                        // "Destination: Jammu Tawi",
                        style: textSt,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}