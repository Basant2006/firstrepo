import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({super.key , required this.name , required this.image , required this.price});
String image;
String name;
dynamic price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child:Column(
          children: [
              Container(
                width: 100,
                  height: 80,
                  child: Image.network('$image')),
            Text('$name'),
            Text('$price'),
          ],
        ),
      ),
    );
  }
}
