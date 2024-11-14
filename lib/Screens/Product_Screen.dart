import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Product_Provider.dart';
import '../Widget/Product_Widget.dart';
import 'Product_Details_Screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Products')),),
      body:Consumer<Product_Provider>(builder: (context, objprovider, child) {
        var objmodel = objprovider.model;
        if(objmodel == null)
          {
            objprovider.getdata_provider();
            return Center(child: CircularProgressIndicator());
          }
        else
          {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 , mainAxisSpacing: 3,
              ),itemCount: objprovider.model?.products.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: ProductWidget(
                    name: objprovider.model?.products[index]['name'],
                    image: objprovider.model?.products[index]['image'],
                    price: objprovider.model?.products[index]['price'],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(
                      name: objprovider.model?.products[index]['name'],
                      image: objprovider.model?.products[index]['image'],
                      description: objprovider.model?.products[index]['description'],
                    ),));
                  },
                );
              }
              ,);
          }
      },),
    );
  }
}
