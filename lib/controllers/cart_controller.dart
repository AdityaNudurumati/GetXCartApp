import 'package:get/get.dart';
import 'package:getx_cart/models/product.dart';

class CartController extends GetxController{
  var cartItems = <Product>[].obs;//anytime cart items changes, automatically going to update, whoever listening that automatically updates.
  //In cartcontroller also, we have list of products.
  double get totalPrice => cartItems.fold(0,(sum,item)=> sum + item.price);
  //instead of creating a field, created a property so when you define get it becomes a property of that particular class
  //we are finding the total price, sum of all cart items. 
  int get count => cartItems.length;

  var testAmount=0.0; //for the GetBuilder

  addToCart(Product product){
    cartItems.add(product);
    testAmount = totalPrice; //For the GetBuilder
    update(); //for the GetBuilder
  }
}