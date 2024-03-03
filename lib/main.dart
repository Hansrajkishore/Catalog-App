import 'package:code_with_flutter/pages/cart_page.dart';
import 'package:code_with_flutter/pages/home_page.dart';
import 'package:code_with_flutter/pages/login_page.dart';
import 'package:code_with_flutter/utils/Routes.dart';
import 'package:code_with_flutter/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Catalog());
}

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.cartPage : (context) => CartPage(),
      },
    );
  }
}
