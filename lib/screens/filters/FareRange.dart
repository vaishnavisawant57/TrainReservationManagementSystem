import 'package:dbms_project/screens/filters/viewFareRange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class FareRange extends StatefulWidget {
  const FareRange({Key? key}) : super(key: key);

  @override
  State<FareRange> createState() => _FareRangeState();
}

class _FareRangeState extends State<FareRange> {
  final minCon=TextEditingController();
  final maxCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Filter By Fare Range"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60,right: 30,left: 30),
        child: ListView(
          children: [
            TextField(
              controller: minCon,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                // icon: const Icon(Icons.train),
                labelText: 'Enter Minimum Fare Value',
              ),
            ),
            TextField(
              controller: maxCon,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                // icon: const Icon(Icons.train),
                labelText: 'Enter Maximum Fare Value',
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: ElevatedButton(
                      onPressed:(){
                        if(minCon.text!='' && maxCon.text!=''){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewFareRange(min: minCon.text,max:maxCon.text)));
                        }
                        else{
                          var snackBar = SnackBar(content: Text(
                              'Enter the Inputs!!'));
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar);
                        }
                      },
                      child: Text(
                        "View Trains",
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
