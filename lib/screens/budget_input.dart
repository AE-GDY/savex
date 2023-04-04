import 'package:flutter/material.dart';
import 'package:savex/features/budget.dart';
import 'package:savex/features/category.dart';
import 'package:intl/intl.dart';



class BudgetInput extends StatefulWidget {
  const BudgetInput({Key? key}) : super(key: key);



  @override
  _BudgetInputState createState() => _BudgetInputState();
}



class _BudgetInputState extends State<BudgetInput> {

  int categoryAmount = 0;

  TextEditingController totalBudgetController = TextEditingController();

  List<TextEditingController> categoryControllers = [TextEditingController(),TextEditingController(),TextEditingController(),];
  List<TextEditingController> limitControllers = [TextEditingController(),TextEditingController(),TextEditingController(),];


  DateTime now = DateTime.now();


  @override
  Widget build(BuildContext context) {

    String formattedDate = DateFormat('MMMM yyyy').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Budget'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 50,
          child: Column(
            children: [
              SizedBox(height: 30,),

              Row(
                children: [

                  Text('Current Date:  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  Text(formattedDate,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,),),
                ],
              ),

              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: totalBudgetController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Total Budget',
                  ),
                ),
              ),

              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurpleAccent,
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          categoryAmount++;
                          categoryControllers.add(TextEditingController());
                          limitControllers.add(TextEditingController());
                        });
                      },
                      child: Text('Add Category',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              Container(
                height: 250,
                child: ListView.builder(
                      itemCount: categoryAmount,
                      itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 250,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: categoryControllers[index],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: ' Category Name',
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 100,
                                child: TextFormField(
                                  controller: limitControllers[index],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '  Limit',
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                            ],
                          ),
                        );
                      }
                    ),
              ),





              Expanded(child: Container()),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){

                    int sum = 0;
                    int idx = 0;

                    while(idx < categoryAmount){
                      sum += int.parse(limitControllers[idx].text);
                      idx++;
                    }

                    int totalBudget = int.parse(totalBudgetController.text);

                    double dailyBudget = totalBudget / 30;

                    if(totalBudget == sum){
                      Budget.budgetCreated = true;

                      List<Category> categories = [];

                      int categoryIndex = 0;

                      while(categoryIndex < categoryAmount){

                        Category currentCategory = Category(
                            title: categoryControllers[categoryIndex].text,
                            spendingLimit: double.parse(limitControllers[categoryIndex].text),
                            amountLeftToSpend: double.parse(limitControllers[categoryIndex].text),
                        );

                        categories.add(currentCategory);

                        categoryIndex++;
                      }

                      Budget budget = Budget(
                          totalBudget: totalBudget,
                          dailyBudget: dailyBudget,
                          totalSpent: 0,
                          month: formattedDate,
                          categories: categories
                      );

                      Budget.userBudget = budget;

                      Navigator.popAndPushNamed(context, '/');

                    }
                    else{
                      // Display Error
                    }

                  },
                  child: Text('Create Budget',style: TextStyle(color: Colors.white),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
