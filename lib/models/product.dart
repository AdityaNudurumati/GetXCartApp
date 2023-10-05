import 'package:get/get.dart';

class Product{
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  Product({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.price
  });

  final isFavorite = false.obs;
  final quantity = 1.obs;//anytime in your product, click on + or -, it will change the quantity and then can multiply with price
  //you can do is define an observable field inside your model; whenever you change the value,it's automatically going to update.
}