import 'package:flutter/cupertino.dart';


// CLASS FOR CREATING A USER ACCOUNT
class UserAccount{

  static UserAccount currentUser = UserAccount(fullName: '', email: '', password: '');
  late String fullName;
  late String email;
  late String password;

  UserAccount({required this.fullName, required this.email, required this.password});

  // LIST FOR STORING REGISTERED USERS
  static List<UserAccount> registeredUsers = [];

  // FUNCTION FOR SIGNING UP USER
  bool signUpUser(bool isSignUp, UserAccount userAccount){
    if(fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty){
      registeredUsers.add(userAccount);
      isSignUp = !isSignUp;
      return true;
    }
    return false;
  }

  // FUNCTION FOR SIGNING IN USER
  static void signInUser(String email, String password, BuildContext context){
    int index = 0;
    while(index < registeredUsers.length){
      if(email == registeredUsers[index].email && password == registeredUsers[index].password){
        UserAccount.currentUser = registeredUsers[index];
        Navigator.popAndPushNamed(context, '/');
      }
      index++;
    }
  }

}


