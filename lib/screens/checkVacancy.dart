import 'package:dbms_project/screens/viewVacancy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CheckVacancy extends StatefulWidget {
  const CheckVacancy({Key? key}) : super(key: key);

  @override
  State<CheckVacancy> createState() => _CheckVacancyState();
}

class _CheckVacancyState extends State<CheckVacancy> {
  var IDCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Check Vacancy"
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
                labelText: 'Enter Train ID',
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: ElevatedButton(
                      onPressed:(){
                        if(IDCon.text!=''){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewVacancy(TrainID: IDCon.text,)));
                        }
                        else{
                          var snackBar = SnackBar(content: Text(
                              'Enter Train ID!!'));
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar);
                        }
                      },
                      child: Text(
                        "View Vacancy",
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
