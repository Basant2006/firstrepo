import 'package:dio/dio.dart';

import '../Models/SignUp_LogIn_Model.dart';

class LogIn_Service
{
  static Dio dio = Dio();
  static Future postdata_LogIn ({ required String email , required String password}) async
  {
    try
    {
      Response response = await dio.post('https://student.valuxapps.com/api/login',
          data: {
            'email':email,
            'password':password
          }
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