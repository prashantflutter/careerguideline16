import 'dart:developer';
import 'package:careerguideline/Admin/Pages/AdminHomePage.dart';
import 'package:careerguideline/AppConstant/Appcolors.dart';
import 'package:careerguideline/User/Pages/HomePage.dart';
import 'package:careerguideline/User/Pages/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Widgets/ButtonWidgets.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyDialogs.dart';
import '../../Widgets/TextFormWidgets.dart';


class LoginPage extends StatefulWidget {
  final bool? isAdmin;
  const LoginPage({super.key, this.isAdmin});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier changeValue = ValueNotifier<int>(0);

  bool isPassword = true;

  void login()async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if(email.isEmpty || password.isEmpty){
      ErrorDialog(context: context, title: 'please fill email and password!', sub1: 'OK', onPressed: ()=>Navigator.pop(context));
    }else{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          log('isAdmin =>  ${widget.isAdmin!}');
          if(widget.isAdmin!){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
          }else{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
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
      appBar: MyAppBar(title: 'User Login',automaticallyImplyLeading: false,),
      body: ValueListenableBuilder(
        valueListenable: changeValue,
        builder: (context,value,child) {
          return Column(
            children: [
              SizedBox(height: 20,),
              Image.asset('assets/PagesImages/login.png',width: double.infinity,height:200,fit: BoxFit.cover,),
              MyTextForm(controller: emailController, hintText: 'Email'),
              MyTextForm(controller: passwordController, hintText: 'Password',obscureText: isPassword,
                suffixIcon: IconButton(onPressed: (){
                  isPassword = !isPassword;
                  changeValue.value++;
                }, icon: Icon(isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined,color: pDark,))
              ),
              MyButton(onPressed: (){
                login();
              }, title: 'Login'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: MyTextButton(title: 'create account | Signup', onPressed: ()=>
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()))),
              ),
            ],
          );
        }
      ),
    );
  }

}
