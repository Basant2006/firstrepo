import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key , required this.name , required this.image , required this.description});
  String image;
  String name;
  String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Product Details')),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('$image'),
            Text('$name'),
            Text('$description'),
          ],
        ),
      ),
    );
  }
}
