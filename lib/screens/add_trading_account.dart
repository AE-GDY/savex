import 'package:flutter/material.dart';
import 'package:savex/features/trading_account.dart';



class AddTradingAccount extends StatefulWidget {
  const AddTradingAccount({Key? key}) : super(key: key);

  @override
  _AddTradingAccountState createState() => _AddTradingAccountState();
}

class _AddTradingAccountState extends State<AddTradingAccount> {

  TextEditingController emailController = TextEditingController();
  TextEditingController platformController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Trading Account'),
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

              SizedBox(height: 30,),

              Row(
                children: [
                  Text('Email linked to account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                ],
              ),

              SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Email',
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Row(
                children: [
                  Text('Trading Platform',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                ],
              ),

              SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: platformController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Platform Name',
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){

                    TradingAccount newTradingAccount = TradingAccount(
                        email: emailController.text,
                        tradingPlatform: platformController.text
                    );

                    linkedTradingAccounts.add(newTradingAccount);

                    Navigator.pushNamed(context, '/');

                  },
                  child: Text('Sync Account',style: TextStyle(
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
