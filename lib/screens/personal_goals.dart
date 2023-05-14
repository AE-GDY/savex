import 'package:flutter/material.dart';
import 'package:savex/features/personal_goal.dart';


class PersonalGoalsScreen extends StatefulWidget {
  const PersonalGoalsScreen({Key? key}) : super(key: key);

  @override
  _PersonalGoalsScreenState createState() => _PersonalGoalsScreenState();
}

class _PersonalGoalsScreenState extends State<PersonalGoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Goals'),
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
          child: ListView.builder(
              itemCount: personalGoals.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 2,
                  child: Container(
                    height: 90,
                    child: ListTile(
                      title: Text(personalGoals[index].description,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      subtitle: Text('Goal type: ${personalGoals[index].type}',),
                      trailing: Container(
                        //height: 150,
                        child: Column(
                          children: [
                            Text('${personalGoals[index].amount} EGP',style: TextStyle(fontWeight: FontWeight.bold,),),
                            Container(
                              width: 90,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: (){

                                },
                                child: Text('Edit',style: TextStyle(
                                  color: Colors.white,
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              ),
        ),
      ),
    );
  }
}
