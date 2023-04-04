import 'package:flutter/material.dart';


Widget bottomNavItem(String title, IconData icon){

  return Column(
    children: [
      IconButton(onPressed: (){}, icon: Icon(icon,color: Colors.grey[600],)),
      Text(title,style: TextStyle(color: Colors.grey[600]),),
    ],
  );


}


