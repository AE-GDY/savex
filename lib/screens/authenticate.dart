import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savex/features/user_account.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool isSignUp = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text(isSignUp?'Sign up now!':'Sign in to continue', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

              SizedBox(height: 50,),

             isSignUp? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey,width: 1),
                ),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: ' Full Name',
                    border: InputBorder.none,
                  ),
                ),
              ):Container(),
              isSignUp?SizedBox(height: 20,):Container(),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey,width: 1),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: ' Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey,width: 1),
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: ' Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 50,),


              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){

                      setState(() {
                        if(isSignUp){
                          signUpUser(nameController.text, emailController.text, passwordController.text);
                        }
                        else{
                          signInUser(emailController.text, passwordController.text);
                        }
                      });


                    },
                  child: Text(isSignUp?'Sign up':'Sign in',style: TextStyle(color: Colors.white),),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isSignUp?"Already have an account? ":"Don't have an account? ", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),),
                  TextButton(
                    onPressed: (){
                      //changeToSignUp();
                      setState(() {
                        isSignUp = !isSignUp;
                      });
                    },
                    child: Text(isSignUp?"Sign in":"Sign up",style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


  bool signUpUser(String fullName, String email, String password){

    if(fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty){
      UserAccount newUserAccount = UserAccount(fullName: fullName, email: email, password: password);
      registeredUsers.add(newUserAccount);
      isSignUp = !isSignUp;
      return true;
    }
    return false;

  }

  void signInUser(String email, String password){

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
