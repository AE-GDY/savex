import 'package:flutter/material.dart';
import 'package:savex/features/personal_goal.dart';


class PersonalGoalSetter extends StatefulWidget {
  const PersonalGoalSetter({Key? key}) : super(key: key);

  @override
  _PersonalGoalSetterState createState() => _PersonalGoalSetterState();
}

class _PersonalGoalSetterState extends State<PersonalGoalSetter> {

  TextEditingController goalController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController timeFrameController = TextEditingController();

  String selected = "Save";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Goal'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 50,
          child: Column(
            children: [

              SizedBox(height: 20,),

              Row(
                children: [
                  Text('Personal Goal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                ],
              ),

              SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: goalController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Goal Description',
                  ),
                ),
              ),
              SizedBox(height: 20,),


              Row(
                children: [
                  Text('Type of Goal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                ],
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 50,
                    //margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selected == "Save"?Colors.deepPurpleAccent:Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          selected = "Save";
                        });
                      },
                      child: Text('Save',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 50,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selected == "Spend"?Colors.deepPurpleAccent:Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          selected = "Spend";
                        });
                      },
                      child: Text('Spend',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 50,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selected == "Generate"?Colors.deepPurpleAccent:Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          selected = "Generate";
                        });
                      },
                      child: Text('Generate',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              Row(
                children: [
                  Text('Amount to Reach',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                ],
              ),

              SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: amountController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Amount (EGP)',
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Row(
                children: [
                  Text('Time to achieve goal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                ],
              ),

              SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: timeFrameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Time frame',
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

                    PersonalGoal newGoal = PersonalGoal(
                        description: goalController.text,
                        type: selected,
                        amount: amountController.text,
                        time: timeFrameController.text
                    );

                    personalGoals.add(newGoal);

                    Navigator.pushNamed(context, '/');

                  },
                  child: Text('Create Goal',style: TextStyle(
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
