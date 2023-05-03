import 'package:flutter/material.dart';


Widget bottomNavItem(String route,BuildContext context,String title, IconData icon){

  return Column(
    children: [
      IconButton(onPressed: (){Navigator.pushNamed(context, route);
      }, icon: Icon(icon,color: Colors.grey[600],)),
      Text(title,style: TextStyle(color: Colors.grey[600]),),
    ],
  );
}


