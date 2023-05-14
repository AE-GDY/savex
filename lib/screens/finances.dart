import 'package:flutter/material.dart';
import 'package:savex/features/income.dart';
import 'package:savex/features/transaction.dart';

import '../features/user_account.dart';


class Finances extends StatefulWidget {
  const Finances({Key? key}) : super(key: key);

  @override
  _FinancesState createState() => _FinancesState();
}

class _FinancesState extends State<Finances> {


  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String selected = 'Income';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Finances',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          height:  MediaQuery.of(context).size.height + 100,
          child: Column(
            children: [

             SizedBox(height: 30,),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   width: 150,
                   height: 50,
                   decoration: BoxDecoration(
                     color: selected == 'Income'?Colors.deepPurpleAccent:Colors.grey,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: TextButton(
                     onPressed: (){
                       setState(() {
                         selected = 'Income';
                       });
                     },
                     child: Text('Income',style: TextStyle(color: Colors.white),),
                   ),
                 ),
                 SizedBox(width: 30,),
                 Container(
                   width: 150,
                   height: 50,
                   decoration: BoxDecoration(
                     color: selected == 'Expenditures'?Colors.deepPurpleAccent:Colors.grey,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: TextButton(
                     onPressed: (){
                       setState(() {
                         selected = 'Expenditures';
                       });
                     },
                     child: Text('Expenditures',style: TextStyle(color: Colors.white),),
                   ),
                 ),
               ],
             ),

             SizedBox(height: 30,),

             Row(children: [Text(selected == 'Income'?'   Income this month':'   Expenditures this month',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),],),

             SizedBox(height: 10,),

             Row(children: [Text(selected == 'Income'?'   6000 EGP':'   9000 EGP',style: TextStyle(fontSize: 17),),],),

             Divider(color: Colors.black,),
             SizedBox(height: 10,),


              Row(children: [Text(selected == 'Income'?'   Income tracking':'   Expenditure Tracking',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),],),

              SizedBox(height: 10,),

              Container(
               height: MediaQuery.of(context).size.height-150,
               child: ListView.builder(
                  itemCount: selected == 'Income'?incomes.length:transactions.length,
                   itemBuilder: (context,index){

                      if(selected == 'Income'){
                        return Card(
                          elevation: 1,
                          child: ListTile(
                            title: Text(incomes[index].jobTitle),
                            trailing: Text('${incomes[index].incomePerMonth} EGP',style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        );
                      }
                      else{
                        return Card(
                          elevation: 1,
                          child: ListTile(
                            title: Text(transactions[index].merchant),
                            subtitle: Text(transactions[index].transactionType),
                            trailing: Text('${transactions[index].amount} EGP',style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        );
                      }
                    }
                   ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
