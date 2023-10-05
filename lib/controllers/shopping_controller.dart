import 'package:get/get.dart';
import 'package:getx_cart/models/product.dart';

class ShoppingController extends GetxController{
  var products = <Product>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchProducts();
  }
  void fetchProducts() async{
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(id: 1, productName: 'First Product', productImage: 'abd', productDescription: "productDescription1", price: 30),
      Product(id: 2, productName: 'Second Product', productImage: 'abd', productDescription: "productDescription2", price: 40),
      Product(id: 3, productName: 'Third Product', productImage: 'abd', productDescription: "productDescription3", price: 50)
    ];
    products.value = productResult;
  }
}