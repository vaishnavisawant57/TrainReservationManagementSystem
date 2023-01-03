import 'package:dbms_project/screens/bookTicket.dart';
import 'package:dbms_project/screens/cancelTicket.dart';
import 'package:dbms_project/screens/checkVacancy.dart';
import 'package:dbms_project/screens/printTrains.dart';
import 'package:dbms_project/screens/searchOptions.dart';
import 'package:dbms_project/screens/searchTrains.dart';
import 'package:dbms_project/screens/viewTicket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //getting size of the screen
    var size=MediaQuery.of(context).size;

    //style
    var cardTextStyle=TextStyle(
        fontFamily: 'Montserrat Regular',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
    );

    var boxSt=BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff789395),
          Color(0xffE5E3C9),
          Color(0xff94B49F),
          Color(0xffB4CFB0),
        ],
      ),
      borderRadius: BorderRadius.circular(10.0),
    );
    return Scaffold(
      body: Stack(

        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 40,left: 20,right: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchOptions()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation:40,
                            // color: Color(0xffB4CFB0),
                            child: Container(
                              decoration: boxSt,
                              child: Padding(
                                padding: EdgeInsets.only(top:40,bottom: 40),
                                child: Center(
                                  child: Text(
                                    'Search Trains',
                                    style: cardTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewTicket()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation:40,
                            // color: Color(0xffB4CFB0),
                            child: Container(
                              decoration: boxSt,
                              child: Padding(
                                padding: EdgeInsets.only(top:40,bottom: 40),
                                child: Center(
                                  child: Text(
                                    'View Your Ticket',
                                    style: cardTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CancelTicket()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation:40,
                            // color: Color(0xffB4CFB0),
                            child: Container(
                              decoration: boxSt,
                              child: Padding(
                                padding: EdgeInsets.only(top:40,bottom: 40),
                                child: Center(
                                  child: Text(
                                    'Cancel Your Ticket',
                                    style: cardTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckVacancy()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation:40,
                            // color: Color(0xffB4CFB0),
                            child: Container(
                              decoration: boxSt,
                              child: Padding(
                                padding: EdgeInsets.only(top:40,bottom: 40),
                                child: Center(
                                  child: Text(
                                    'Check Vacancy',
                                    style: cardTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      // crossAxisCount: 2,

                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
