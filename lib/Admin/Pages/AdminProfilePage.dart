import 'package:careerguideline/Admin/Pages/AdminHomePage.dart';
import 'package:flutter/material.dart';
import '../../AppConstant/Appcolors.dart';
import '../../Widgets/ButtonWidgets.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyDialogs.dart';
import '../../Widgets/TextWidgets.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: MyAppBar(title: 'Admin Profiles',automaticallyImplyLeading: false,),
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
            TitleWithData(title: 'Name', data: 'Admin Name'),
            TitleWithData(title: 'Email', data: 'ddmin@gmail.com'),
            TitleWithData(title: 'Gender', data: 'Male'),
            TitleWithData(title: 'Address', data: 'Tops Technology Rajkot'),
            SizedBox(height: 30,),

            MyButton(title: 'Delete Admin Account',width: 250, onPressed: (){
              LogoutNow(context: context,
                  title: 'Are sure want to delete account?',
                  sub1: 'Yes',
                  sub2: 'No',
                  onPressed1: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminHomePage())),
                  onPressed2: ()=>Navigator.pop(context));
            })
          ],
        ),
      ),
    );
  }
}
