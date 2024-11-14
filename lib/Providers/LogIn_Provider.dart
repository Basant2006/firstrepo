import 'package:flutter/material.dart';

import '../Models/SignUp_LogIn_Model.dart';
import '../Services/LogIn_Service.dart';

class LogIn_Provider with ChangeNotifier
{
  SignUp_Model? modelObj;
  Future<bool> Post_LogIn (String email , String password) async
  {
    modelObj = await LogIn_Service.postdata_LogIn(email: email , password: password);
    notifyListeners();
    return true;
  }
}