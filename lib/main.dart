import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/LogIn_Provider.dart';
import 'Providers/Product_Provider.dart';
import 'Providers/SignUp_Provider.dart';
import 'Screens/SignUp_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUp_Provider(),),
        ChangeNotifierProvider(create: (context) => LogIn_Provider(),),
        ChangeNotifierProvider(create: (context) => Product_Provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  SignupScreen(),
      ),
    );
  }
}
