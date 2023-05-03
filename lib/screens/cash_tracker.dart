import 'package:flutter/material.dart';
import 'package:savex/features/cash_tracker.dart';


class CashTracker extends StatefulWidget {
  const CashTracker({Key? key}) : super(key: key);

  @override
  _CashTrackerState createState() => _CashTrackerState();
}

class _CashTrackerState extends State<CashTracker> {

  TextEditingController upToTwelvePMController = TextEditingController();
  TextEditingController upToSixPMController = TextEditingController();
  TextEditingController upToTwelveAMController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's cash tracker"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 50,
          child: Column(
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  Text('Amount Spend up to 12:00 PM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: upToTwelvePMController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Amount (EGP)',
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Row(
                children: [
                  Text('Amount Spend up to 6:00 PM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: upToSixPMController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Amount (EGP)',
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Row(
                children: [
                  Text('Amount Spend up to 12:00 AM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: upToTwelveAMController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Amount (EGP)',
                  ),
                ),
              ),


              SizedBox(height: 30,),

              Container(
                width: MediaQuery.of(context).size.width ,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){

                    CashTrackerModel newTrace = CashTrackerModel(
                        upToSixPM: upToSixPMController.text,
                        upToTwelveAM: upToTwelveAMController.text,
                        upToTwelvePM: upToTwelvePMController.text
                    );

                    cashTraces.add(newTrace);

                    Navigator.pushNamed(context, '/');

                  },
                  child: Text('Submit',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
