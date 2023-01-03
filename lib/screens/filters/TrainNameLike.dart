import 'package:dbms_project/screens/filters/ViewTrainNameLike.dart';
import 'package:flutter/material.dart';
class TrainNameLike extends StatefulWidget {
  const TrainNameLike({Key? key}) : super(key: key);

  @override
  State<TrainNameLike> createState() => _TrainNameLikeState();
}

class _TrainNameLikeState extends State<TrainNameLike> {
  final patternCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Train Name Filtering"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60,right: 30,left: 30),
        child: ListView(
          children: [
            Text(
              "Enter Search String (in Train Name):",
              style: TextStyle(
                fontSize: 18
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: patternCon,
              decoration: const InputDecoration(
                icon: const Icon(Icons.train),
                labelText: 'Enter Search String',
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: ElevatedButton(
                      onPressed:(){
                        if(patternCon.text!=''){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewTrainNameLike(Pattern: patternCon.text,)));
                        }
                        else{
                          var snackBar = SnackBar(content: Text(
                              'Enter the Input!!'));
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
