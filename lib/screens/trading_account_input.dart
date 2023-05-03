import 'package:flutter/material.dart';

import '../features/trading_account.dart';


class TradingAccountInput extends StatefulWidget {
  const TradingAccountInput({Key? key}) : super(key: key);

  @override
  _TradingAccountInputState createState() => _TradingAccountInputState();
}

class _TradingAccountInputState extends State<TradingAccountInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sync Trading Accounts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                children: [
                  Text('Linked Trading Accounts',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
                ],
              ),

              SizedBox(height: 30,),

              Container(
                height: MediaQuery.of(context).size.height - 270,
                child: Card(
                  elevation: 3,
                  child: ListView.builder(
                      itemCount: linkedTradingAccounts.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          leading: Icon(Icons.credit_card_rounded,color: Colors.blue,),
                          subtitle: Text(linkedTradingAccounts[index].email),
                          title: Text(linkedTradingAccounts[index].tradingPlatform),
                          trailing: Icon(Icons.check,color: Colors.green,),
                        );
                      }
                  ),
                ),
              ),

              Expanded(child: Container()),


              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){Navigator.pushNamed(context, '/add_trading_account');},
                  child: const Text('Add Trading Account',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
