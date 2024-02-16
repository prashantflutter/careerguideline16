import 'package:careerguideline/User/Pages/HomePage.dart';
import 'package:careerguideline/Widgets/ButtonWidgets.dart';
import 'package:careerguideline/Widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import '../../AppConstant/Appcolors.dart';
import '../../Widgets/MyDialogs.dart';
import '../../Widgets/TextWidgets.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'User Profiles',automaticallyImplyLeading: false,),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            CircleAvatar(
              radius: 60,
              backgroundColor: pDark,
              child: Icon(Icons.person,color: pWhite,size: 60,),
            ),
            SizedBox(height: 30,),
            TitleWithData(title: 'Name', data: 'userName'),
            TitleWithData(title: 'Email', data: 'user@gmail.com'),
            TitleWithData(title: 'Gender', data: 'Male'),
            TitleWithData(title: 'Address', data: 'Tops Technology Rajkot'),
            SizedBox(height: 30,),

            MyButton(title: 'Delete Account',width: 200, onPressed: (){
              LogoutNow(context: context,
                  title: 'Are sure want to logout?',
                  sub1: 'Yes',
                  sub2: 'No',
                  onPressed1: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage())),
                  onPressed2: ()=>Navigator.pop(context));
              })
          ],
        ),
      ),
    );
  }
}
