import 'package:dio/dio.dart';

import '../Models/Product_Model.dart';

class Product_Service
{
  static Dio dio = Dio();
  static Future getdata ()async
  {
    try {
      Response response = await dio.get('https://student.valuxapps.com/api/home');
      if(response.statusCode == 200)
        {
          return Product_Model.fromjson(response.data);
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