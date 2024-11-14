import 'package:flutter/material.dart';

import '../Models/SignUp_LogIn_Model.dart';
import '../Services/SignUp_Service.dart';

class SignUp_Provider with ChangeNotifier
{
  SignUp_Model? modelObj;
  Future Post_SignUp (String name , String phone , String email , String password) async
  {
    modelObj = await SignUp_Service.postdata_SignUp(name: name , phone: phone , email: email , password: password);
    notifyListeners();
    return true;
  }
}