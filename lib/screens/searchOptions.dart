import 'package:dbms_project/screens/filters/FareRange.dart';
import 'package:dbms_project/screens/filters/GroupBySource.dart';
import 'package:dbms_project/screens/filters/OrderBySeats.dart';
import 'package:dbms_project/screens/filters/TrainNameLike.dart';
import 'package:dbms_project/screens/printTrains.dart';
import 'package:dbms_project/screens/searchTrains.dart';
import 'package:flutter/material.dart';
class SearchOptions extends StatelessWidget {
  const SearchOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardTextStyle=TextStyle(
        fontFamily: 'Satisfy',
        fontSize: 24,
        // fontWeight: FontWeight.bold,
        color: Colors.black
    );
    var boxst=BoxDecoration(
                border: Border.all(width:3,color: Color(0xff789395)),
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffB4CFB0),
                  Color(0xff94B49F),
                  Color(0xff789395),
                  Color(0xffE5E3C9),
                  ],
                ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10,right: 30,left: 30,bottom: 10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 40,
          crossAxisSpacing: 20,
          primary: false,
          children: [
            FlatButton(
              onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrintTrains()));
                  },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  elevation:10,
                  child: Container(
                      decoration:boxst,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: 5,left: 5),
                          child: Text(
                            'All Trains',
                            style: cardTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchTrainPage()));
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  elevation:10,
                  child: Container(
                    decoration:boxst,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5,left: 5),
                        child: Text(
                          'Search by Source and Destination',
                          style: cardTextStyle,
                        ),
                      ),
                    ),
                  )
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FareRange()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                elevation:10,
                child: Container(
                  decoration:boxst,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 5,left: 5),
                      child: Text(
                        'Fare Range',
                        style: cardTextStyle,
                      ),
                    ),
                  ),
                )
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrainNameLike()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                elevation:10,
                child: Container(
                  decoration:boxst,
                  child: Center(
                    child: Text(
                      'Search By Name:',
                      style: cardTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderBySeats()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                elevation:10,
                child: Container(
                  decoration:boxst,
                  child: Center(
                    child: Text(
                      'Order by Number of Seats',
                      style: cardTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupBySource()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                elevation:10,
                child: Container(
                  decoration:boxst,
                  child: Center(
                    child: Text(
                      'Count of Trains',
                      style: cardTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
