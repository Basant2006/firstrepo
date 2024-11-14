import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/LogIn_Provider.dart';
import 'Product_Screen.dart';
import 'SignUp_Screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var fromkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Log In')),),
      body: Consumer<LogIn_Provider>(builder: (context, providerobj, child) {
        return Form(
          key: fromkey,
          child: Column(
            children: [
              // for email =>
              TextFormField(
                controller: email,
                validator: (value) {
                  if(value!.isEmpty || value?.length == null)
                  {
                    return 'please enter your email !';
                  }
                  return null;
                },
                decoration: InputDecoration( hintText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

              ),
              SizedBox(height: 10,),
              // for password =>
              TextFormField(
                controller: password,
                validator: (value) {
                  if(value!.isEmpty || value?.length == null)
                  {
                    return 'please enter your password !';
                  }
                  return null;
                },
                decoration: InputDecoration( hintText: 'password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

              ),
              SizedBox(height: 10,),
              TextButton(onPressed: () async{
                if(fromkey.currentState!.validate())
                {
                  bool login = await providerobj.Post_LogIn( email.text, password.text);
                  if(login)
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                  }
                }
              }, child: const Text('Log In'),),
              Row(
                children: [
                  Text('Do not have account ?'),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupScreen(),));
                  }, child: Text('Sign Up'))
                ],
              )
            ],
          ),
        );
      },),
    );
  }
}
