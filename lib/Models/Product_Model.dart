class Product_Model
{
  List<dynamic>products;
  Product_Model({required this.products});
  factory Product_Model.fromjson(Map<String , dynamic>json)
  {
    return Product_Model(products: json['data']['products']);
  }
}
