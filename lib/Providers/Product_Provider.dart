import 'package:flutter/cupertino.dart';

import '../Models/Product_Model.dart';
import '../Services/Product_Service.dart';

class Product_Provider with ChangeNotifier
{
  Product_Model?model;
  Future getdata_provider()async
  {
    model = await Product_Service.getdata();
    notifyListeners();
  }
}