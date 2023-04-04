import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savex/features/budget.dart';
import 'package:savex/widgets/bottom_navigator_item.dart';

import '../features/user_account.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  TextStyle titleStyle = TextStyle(fontSize: 14,color: Colors.grey[600],fontWeight: FontWeight.bold,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){scaffoldKey.currentState?.openDrawer();},icon: Icon(Icons.menu,color: Colors.white,),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 165,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle,size: 60,color: Colors.deepPurple,),
                      SizedBox(width: 16,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(UserAccount.currentUser.fullName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "Brand-Bold",),),
                          SizedBox(height: 6,),
                          Text("Visit Profile",),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Divider(
                height: 1,
                thickness: 1,
              ),

              SizedBox(height: 12,),

              ListTile(
                leading: Icon(Icons.person,color: Colors.deepPurple,),
                title: Text("Profile",style: TextStyle(fontSize: 15,),),
              ),

              ListTile(
                leading: Icon(Icons.wallet_rounded,color: Colors.deepPurple,),
                title: Text("Dashboard",style: TextStyle(fontSize: 15,),),
                onTap: (){
                  Navigator.pushNamed(context, '/schedule');
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card_rounded,color: Colors.deepPurple,),
                title: Text("Bank Accounts",style: TextStyle(fontSize: 15,),),
                onTap: (){
                  Navigator.pushNamed(context, '/bank_account_input');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.deepPurple,),
                title: Text("Settings",style: TextStyle(fontSize: 15,),),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Card(
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomNavItem('List', Icons.checklist),
              bottomNavItem('Distribution', Icons.pie_chart_rounded),
              Container(width: 60,height:60,decoration:BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.deepPurpleAccent),child: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,size: 30,))),
              bottomNavItem('Dashboard', Icons.wallet_rounded),
              bottomNavItem('Settings', Icons.settings),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          height:  MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text('BUDGET',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Budget.budgetCreated?Container(
                              height: 160,
                              width:160,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(80),
                                border: Border.all(color: Colors.white,width: 5),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home_rounded,color: Colors.white,size: 60,),
                                  SizedBox(height: 5,),
                                  Text('${(Budget.userBudget.totalBudget - Budget.userBudget.totalSpent).round()} EGP',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                  SizedBox(height: 5,),
                                  Text('LEFT TO SPEND',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ):Container(),

                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 230,
                      left: (MediaQuery.of(context).size.width / 2) - (MediaQuery.of(context).size.width * 0.8/2),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height / 4.7,
                        decoration: BoxDecoration(

                        ),
                        child: Card(
                          child: Budget.budgetCreated?Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(height: 20,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.arrow_back,color: Colors.grey[600],),
                                    Text(Budget.userBudget.month,style: titleStyle),
                                    Icon(Icons.arrow_forward,color: Colors.grey[600],),
                                  ],
                                ),


                                SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Column(
                                      children: [
                                        Text('Projection',style: TextStyle(fontSize: 14,color: Colors.grey[500],fontWeight: FontWeight.bold,)),
                                        SizedBox(height: 5,),
                                        Text('${Budget.userBudget.totalBudget} EGP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Daily Budget',style: TextStyle(fontSize: 14,color: Colors.grey[500],fontWeight: FontWeight.bold,),),
                                        SizedBox(height: 5,),
                                        Text('${Budget.userBudget.dailyBudget.round()} EGP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Text('Total Spend',style: TextStyle(fontSize: 14,color: Colors.grey[500],fontWeight: FontWeight.bold,),),
                                        SizedBox(height: 5,),
                                        Text('${Budget.userBudget.totalSpent.round()} EGP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ):Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("No Budget Created",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                                SizedBox(height: 20,),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(onPressed: (){ Navigator.pushNamed(context, '/budget_input'); },child: Text('Create Budget',style: TextStyle(color: Colors.white),),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Budget.budgetCreated?Text('BUDGET DISTRIBUTION', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[600]),):Container(),
              SizedBox(height: 20,),

              Budget.budgetCreated?Container(
                height: 120,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Budget.userBudget.categories.length,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemBuilder: (context,index){
                      return Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 120,
                        child: Container(
                          alignment: Alignment.center,
                          child: Card(
                            elevation: 3,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(Budget.userBudget.categories[index].title,style: TextStyle(color: Colors.grey[500],fontSize: 15,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 20,),
                                  Text('${Budget.userBudget.categories[index].amountLeftToSpend.round()} EGP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                  Text('remaining',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ):Container(),

            ],
          ),
        ),
      ),
    );
  }
}
