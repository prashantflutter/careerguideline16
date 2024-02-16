import 'package:careerguideline/User/Pages/SignUpPage.dart';
import 'package:careerguideline/Widgets/ButtonWidgets.dart';
import 'package:careerguideline/Widgets/MyAppBar.dart';
import 'package:flutter/material.dart';


class SelectAccountPage extends StatelessWidget {
  const SelectAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Create Account',automaticallyImplyLeading: false,),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset('assets/PagesImages/account.png',width: double.infinity,fit: BoxFit.cover,),
          ),
          MyButton(title: 'Admin Account', width: 200,onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(isAdmin: true,)));
        }),
          MyButton(title: 'User Account', width: 200,onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(isAdmin: false)));
        })
        ],
      ),
    );
  }
}
