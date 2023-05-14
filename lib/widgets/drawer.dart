import 'package:flutter/material.dart';

import '../features/user_account.dart';



Widget appDrawer(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {

  return Container(
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
            title: Text("Finances",style: TextStyle(fontSize: 15,),),
            onTap: (){
              Navigator.pushNamed(context, '/finances');
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
            leading: Icon(Icons.credit_card_rounded,color: Colors.deepPurple,),
            title: Text("Trading Accounts",style: TextStyle(fontSize: 15,),),
            onTap: (){
              Navigator.pushNamed(context, '/trading_account_input');
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics_outlined,color: Colors.deepPurple,),
            title: Text("Analytics",style: TextStyle(fontSize: 15,),),
            onTap: (){
              Navigator.pushNamed(context, '/analytics');
            },
          ),
          ListTile(
            leading: Icon(Icons.person,color: Colors.deepPurple,),
            title: Text("Personal Goals",style: TextStyle(fontSize: 15,),),
            onTap: (){
              Navigator.pushNamed(context, '/personal_goal_setter');
            },
          ),
          ListTile(
            leading: Icon(Icons.data_exploration,color: Colors.deepPurple,),
            title: Text("Future Analysis",style: TextStyle(fontSize: 15,),),
            onTap: (){
              Navigator.pushNamed(context, '/future');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.deepPurple,),
            title: Text("Settings",style: TextStyle(fontSize: 15,),),
          ),

        ],
      ),
    ),
  );

}