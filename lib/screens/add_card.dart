import 'package:flutter/material.dart';
import 'package:savex/features/bank_account.dart';


class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController cardNicknameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card'),
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

              SizedBox(height: 50,),

              Row(children: [
                Text('Credit Card',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),
              ],),

              SizedBox(height: 20,),

              Row(
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    child: Image.asset(
                        'assets/cards.PNG'
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Cardholder Name',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: numberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Card Number',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: cardNicknameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Card Nickname',
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width / 2) * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: expiryController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' MM/YY',
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: (MediaQuery.of(context).size.width / 2) * 0.8,
                    child: TextFormField(
                      controller: cvcController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' CVC',
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(child: Container()),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){

                    String cardNickname = '';
                    String cardFinalFourNumbers = '';

                    if(cardNicknameController.text.isEmpty){

                      String cardNumber = numberController.text;

                      int cardNumberIndex = 0;
                      while(cardNumberIndex < cardNumber.length){
                        if(cardNumberIndex >= 12){
                          cardFinalFourNumbers += cardNumber[cardNumberIndex];
                        }
                        cardNumberIndex++;
                      }

                      cardNickname = 'Visa $cardFinalFourNumbers';
                    }
                    else{
                      cardNickname = cardNicknameController.text;
                    }


                      BankAccount newAccount = BankAccount(
                          accountNumber: numberController.text,
                          expiryDate: expiryController.text,
                          cvc: cvcController.text,
                          nickName: cardNickname,
                      );


                      linkedAccounts.add(newAccount);

                      Navigator.popAndPushNamed(context, '/bank_account_input');
                    },
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
