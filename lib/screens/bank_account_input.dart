import 'package:flutter/material.dart';
import 'package:savex/features/bank_account.dart';




class BankAccountInput extends StatefulWidget {
  const BankAccountInput({Key? key}) : super(key: key);

  @override
  _BankAccountInputState createState() => _BankAccountInputState();
}

class _BankAccountInputState extends State<BankAccountInput> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Accounts'),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Row(
                children: [
                  Text('Linked Accounts',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
                ],
              ),

              SizedBox(height: 30,),

              Container(
                height: MediaQuery.of(context).size.height - 270,
                child: Card(
                  elevation: 3,
                  child: ListView.builder(
                      itemCount: linkedAccounts.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          leading: Icon(Icons.credit_card_rounded,color: Colors.blue,),
                          subtitle: Text(linkedAccounts[index].expiryDate),
                          title: Text(linkedAccounts[index].nickName),
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
                  onPressed: (){Navigator.pushNamed(context, '/add_card');},
                  child: Text('Add Card',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
