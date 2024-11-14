import 'package:dio/dio.dart';

import '../Models/SignUp_LogIn_Model.dart';

class SignUp_Service
{
  static Dio dio = Dio();
  static Future<SignUp_Model> postdata_SignUp ({required String name , required String phone , required String email , required String password}) async
  {
    try
    {
      Response response = await dio.post('https://student.valuxapps.com/api/login',
          data: {
            'name':name,
            'phone':phone,
            'email':email,
            'password':password
          },
      );
      if(response.statusCode! == 200)
      {
        return SignUp_Model.fromjson(response.data);
      }
      else
      {
        return throw Exception('check your URL');
      }
    }
    catch(e)
    {
      throw Exception('Server Error $e');
    }
  }
}