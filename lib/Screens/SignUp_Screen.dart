import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/SignUp_Provider.dart';
import 'LogIn_Screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var _fromkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Sign Up')),),
      body: Consumer<SignUp_Provider>(builder: (context, providerobj, child) {
       return Form(
          key: _fromkey,
          child: Column(
            children: [
              //  for user name =>
              TextFormField(
                controller: username,
                validator: (value) {
                  if(value!.isEmpty || value?.length == null)
                    {
                      return 'please enter your name!';
                    }
                  return null;
                },
                decoration: InputDecoration(hintText: 'user name' ,border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 10,),
              // for phone
              TextFormField(
                controller: phone,
                validator: (value) {
                  if(value!.isEmpty || value?.length == null)
                  {
                    return 'please enter your phone !';
                  }
                  if(value.length < 11 || value.length > 11)
                    {
                      return 'phone number must be = 11 numbers';
                    }
                  return null;
                },
                decoration: InputDecoration( hintText: 'Phone number',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

              ),
              SizedBox(height: 10,),
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
                  if(value.length < 3 )
                    {
                      return 'password must be grater than 3 numbers or char';
                    }
                  return null;
                },
                decoration: InputDecoration( hintText: 'password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

              ),
              SizedBox(height: 10,),
              TextButton(onPressed: () async{
                if(_fromkey.currentState!.validate())
                  {
                    bool signup = await providerobj.Post_SignUp(username.text, phone.text, email.text, password.text);
                    if(signup)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      }
                  }
              }, child: const Text('Sign Up'),),
              SizedBox(height: 10,),
              Row(
                children: [
                  const Text('Aready Have Account ? '),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }, child: Text('Log In'))
                ],
              )
            ],
          ),
        );
      },),
    );
  }
}
