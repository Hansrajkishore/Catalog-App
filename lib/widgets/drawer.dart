import 'package:code_with_flutter/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final img = "assets/images/hk.png";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 10 , right: 7),
        children: [
          DrawerHeader(
            padding:  EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: "Hansraj Kishore".text.make(),
                accountEmail: "hansrajkishore35@gmail.com".text.make(),
                currentAccountPicture: CircleAvatar(backgroundImage: AssetImage(img),),
              )
          ),
          ListTile(
            onTap:(){ Navigator.pushNamed(context, MyRoutes.loginRoute);},
            leading: Icon(CupertinoIcons.home),
            title: "Home".text.bold.black.make(),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: "Profile".text.bold.black.make(),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.star_fill),
            title: "Rating".text.bold.black.make(),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, MyRoutes.cartPage);
            },
            leading: Icon(CupertinoIcons.cart_fill),
            title: "Your Cart".text.bold.black.make(),
          ),
          200.heightBox,
          Divider(height: 1,indent: 5,endIndent: 5, thickness: 1,),
          20.heightBox,
          "Version 1.0.0".text.makeCentered(),
        ],
      ),
    );
  }
}
