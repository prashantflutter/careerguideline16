import 'dart:developer';

import 'package:careerguideline/AppConstant/Appcolors.dart';
import 'package:careerguideline/User/Pages/LoginPage.dart';
import 'package:careerguideline/Widgets/MyDialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Widgets/ButtonWidgets.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/TextFormWidgets.dart';


class SignUpPage extends StatefulWidget {
  final bool? isAdmin;
  const SignUpPage({super.key, this.isAdmin});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  ValueNotifier changeValue = ValueNotifier<int>(0);
  ValueNotifier changeValue2 = ValueNotifier<int>(0);

  bool isPassword = true;
  bool isCPassword = true;

  void signup()async{
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();
    if(name.isEmpty || email.isEmpty || password.isEmpty || cPassword.isEmpty){
      ErrorDialog(context: context, title: 'please fill all details!', sub1: 'OK', onPressed: ()=>Navigator.pop(context));
    }else if(password != cPassword){
      ErrorDialog(context: context, title: 'password are do not match!', sub1: 'OK', onPressed: ()=>Navigator.pop(context));
    }else{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          log('isAdmin == ${widget.isAdmin}');
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage(isAdmin: widget.isAdmin,)));
        }
      }on FirebaseException catch(ex){
        ErrorDialog(context: context, title: ex.code.toString().replaceAll('_', ' '), sub1: 'OK', onPressed: ()=>Navigator.pop(context));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        automaticallyImplyLeading: false,
        title: 'User Signup',),
      body: ValueListenableBuilder(
        valueListenable: changeValue,
        builder: (context,value,child) {
          return Column(
            children: [
              SizedBox(height: 20,),
              Image.asset('assets/PagesImages/signup.png',width: double.infinity,height:200,fit: BoxFit.cover,),
              MyTextForm(controller: nameController, hintText: 'Name'),
              MyTextForm(controller: emailController, hintText: 'Email'),
              MyTextForm(controller: passwordController, hintText: 'Password',obscureText: isPassword,
                suffixIcon: IconButton(onPressed: (){
                  isPassword = !isPassword;
                  changeValue.value++;
                }, icon: Icon(isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined,color: pDark,))
              ),
              MyTextForm(controller: cPasswordController, hintText: 'Confirm Password',obscureText: isPassword,
                suffixIcon: IconButton(onPressed: (){
                  isCPassword = !isCPassword;
                  changeValue.value++;
                }, icon: Icon(isCPassword?Icons.visibility_outlined:Icons.visibility_off_outlined,color: pDark,),),
              ),
              MyButton(onPressed: (){
                signup();
              }, title: 'Login'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: MyTextButton(title: 'already account | login', onPressed: ()=>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(isAdmin: widget.isAdmin,)))),
              ),
            ],
          );
        }
      ),
    );
  }

}
