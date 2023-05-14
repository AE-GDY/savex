import 'package:flutter/material.dart';
import 'package:savex/features/budget.dart';
import 'package:savex/widgets/bottom_navigator_item.dart';
import '../features/discount.dart';
import '../widgets/drawer.dart';

// HOME SCREEN / WIDGET
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

      // APP BAR
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){scaffoldKey.currentState?.openDrawer();},icon: Icon(Icons.menu,color: Colors.white,),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),

      // DRAWER
      drawer: appDrawer(context, scaffoldKey),

      // BOTTOM NAVIGATOR
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Card(
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomNavItem('/personal_goals_screen',context,'Goals', Icons.checklist),
              bottomNavItem('/cash_tracker',context,'Tracker', Icons.money),
              bottomNavItem('/analytics',context,'Analytics', Icons.analytics_outlined),
              bottomNavItem('/finances',context,'Finances', Icons.wallet_rounded),
              bottomNavItem('/personal_goals_screen',context,'Settings', Icons.settings),
            ],
          ),
        ),
      ),

      // BODY OF SCREEN
      body: homeScreenBody(context),
    );
  }


  // HOME BODY WIDGET
  Widget homeScreenBody(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      child: SizedBox(
        height:  MediaQuery.of(context).size.height + 300,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.8,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          const Text('BUDGET',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
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
                                const Icon(Icons.home_rounded,color: Colors.white,size: 60,),
                                const SizedBox(height: 5,),
                                Text('${(Budget.userBudget.totalBudget - Budget.userBudget.totalSpent).round()} EGP',textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                const SizedBox(height: 5,),
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
                      decoration: const BoxDecoration(

                      ),
                      child: Card(
                        child: Budget.budgetCreated?Container(
                          margin: const EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            children: [

                              const SizedBox(height: 20,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.arrow_back,color: Colors.grey[600],),
                                  Text(Budget.userBudget.month,style: titleStyle),
                                  Icon(Icons.arrow_forward,color: Colors.grey[600],),
                                ],
                              ),

                              const SizedBox(height: 30,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Column(
                                    children: [
                                      Text('Projection',style: TextStyle(fontSize: 14,color: Colors.grey[500],fontWeight: FontWeight.bold,)),
                                      const SizedBox(height: 5,),
                                      Text('${Budget.userBudget.totalBudget} EGP',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Daily Budget',style: TextStyle(fontSize: 14,color: Colors.grey[500],fontWeight: FontWeight.bold,),),
                                      const SizedBox(height: 5,),
                                      Text('${Budget.userBudget.dailyBudget.round()} EGP',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text('Total Spend',style: TextStyle(fontSize: 14,color: Colors.grey[500],fontWeight: FontWeight.bold,),),
                                      const SizedBox(height: 5,),
                                      Text('${Budget.userBudget.totalSpent.round()} EGP',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ):Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("No Budget Created",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                            const SizedBox(height: 20,),
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
                ],
              ),
            ),
            const SizedBox(height: 10,),

            Budget.budgetCreated?Text('BUDGET DISTRIBUTION', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[600]),):Container(),
            const SizedBox(height: 20,),

            Budget.budgetCreated?SizedBox(
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Budget.userBudget.categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
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
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(Budget.userBudget.categories[index].title,style: TextStyle(color: Colors.grey[500],fontSize: 15,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 20,),
                                Text('${Budget.userBudget.categories[index].amountLeftToSpend.round()} EGP',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                const Text('remaining',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ):Container(),


            Row(
              children: const [
                Text('  General Discounts', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),

            const SizedBox(height: 20,),

            SizedBox(
              height: 150,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: generalDiscounts.length,
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      alignment: Alignment.center,
                      width: 110,
                      height: 150,
                      child: Container(
                        alignment: Alignment.center,
                        child: Card(
                          elevation: 3,
                          child: Container(
                            height: 140,
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(generalDiscounts[index].merchant,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                                SizedBox(
                                  width: 50,
                                  height: 44, //
                                  child: Image.asset('assets/${generalDiscounts[index].image}'),
                                ),
                                const SizedBox(height: 15,),
                                Text(generalDiscounts[index].discountAmount,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),

            const SizedBox(height: 10,),

            Row(
              children: const [
                Text('  Special Discounts', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),

            const SizedBox(height: 20,),

            Container(
              height: 150,
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: personalDiscounts.length,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      alignment: Alignment.center,
                      width: 110,
                      height: 150,
                      child: Container(
                        alignment: Alignment.center,
                        child: Card(
                          elevation: 3,
                          child: Container(
                            height: 140,
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(personalDiscounts[index].merchant,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                                SizedBox(
                                  width: 50,
                                  height: 44, //
                                  child: Image.asset('assets/${personalDiscounts[index].image}'),
                                ),
                                const SizedBox(height: 15,),
                                Text(personalDiscounts[index].discountAmount,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }

}
