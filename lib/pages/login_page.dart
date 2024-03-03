
import 'package:code_with_flutter/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();

  bool clicked = false;
  final _formkey = GlobalKey<FormState>();


moveToHome(BuildContext context) async {
  if(_formkey.currentState!.validate()) {
    setState(() {
      clicked = true;
    });
    await Future.delayed(Duration(seconds: 2));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      clicked = false;
    });
  }
}

  @override


  Widget build(BuildContext context) {






    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png" , fit: BoxFit.cover,),
              50.heightBox,
              "Welcome".text.xl3.bold.black.make(),
              30.heightBox,
              TextFormField(

                validator: (value) {
                  if(value!.isEmpty){
                    return "Please Enter Your Email";
                  }
                  else{
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                controller: userEmail,
                decoration: InputDecoration(
                  hintText: "enter email",
                  labelText: "Email",
                  suffixIcon: Icon(CupertinoIcons.mail)
                ),
              ).px32().py16(),

              TextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return "Please Enter Your Password";
                  }
                  else if(value!.isNotEmpty && value.length<6){
                    return "Password Must be Greater than 6 digits";
                  }
                  else{
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                obscuringCharacter: '*',
                controller: password,
                decoration: InputDecoration(
                    hintText: "enter password",
                    labelText: "Password",
                    suffixIcon: Icon(CupertinoIcons.lock)
                ),
              ).px32(),
              30.heightBox,
              InkWell(
                onTap: () async => moveToHome(context),
                child: AnimatedContainer(duration: Duration(milliseconds : 1100),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(clicked?50:10)
                  ),
                  width: clicked?50:150,
                  height: 50,
                  child: clicked?Icon(Icons.done , color: Colors.white,):"Login".text.bold.xl.white.make().centered(),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
