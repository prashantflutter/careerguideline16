import 'package:careerguideline/AppConstant/AppTextStyle.dart';
import 'package:careerguideline/AppConstant/Appcolors.dart';
import 'package:careerguideline/User/Pages/HomePage.dart';
import 'package:careerguideline/User/Pages/LoginPage.dart';
import 'package:careerguideline/Widgets/MyDialogs.dart';
import 'package:careerguideline/Widgets/TextWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../User/Pages/UserProfilePage.dart';

Widget MyDrawer(BuildContext context,{bool isAdmin = false}){
  return Drawer(
    backgroundColor: pDark,
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(top: 40),
          color: pWhite,
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: pDark,
                child: Icon(Icons.person,color: pWhite,size: 45,),
              ),
              myTitle(data: isAdmin?'Admin Name':'User Name'),
            ],
          ),
        ),
        SizedBox(height: 20,),
        MyListTiles(title: 'Home', icon: Icons.home_outlined,
        onTap: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }),
        MyListTiles(title: isAdmin?'Admin Profile':'User Profile',onTap: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfilePage()));
        }, icon: Icons.account_circle_outlined),
        MyListTiles(title: 'Logout',onTap: (){
          LogoutNow(context: context,
              title: 'Are sure want to logout?',
              sub1: 'Yes',
              sub2: 'No',
              onPressed1: ()async{
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
            },
              onPressed2: ()=>Navigator.pop(context));
        }, icon: Icons.logout,),
      ],
    ),
  );
}

Widget MyListTiles({required String title,void Function()? onTap,required IconData icon}){
  return ListTile(
    onTap: onTap,
    leading: Icon(icon,color: pWhite,size: 30,),
    title: Text(title,style: textStyle.copyWith(color: pWhite),),
    trailing: Icon(Icons.navigate_next_sharp,color: pWhite,size: 30,),
  );
}