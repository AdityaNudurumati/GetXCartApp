import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cart/controllers/cart_controller.dart';
import 'package:getx_cart/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController());
    final cartController = Get.put(CartController());
    //one time you put something in dependency like CartController, you don't have to create it again.
    //Entire life cycle of the application, until you destroy this page, its going to be there in dependency.
    //From this page you are navigate to next page,there also you can find this controller.you just have to write get.find()
    //it's one time process, bcz it's dependency injection.
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: Colors.amber,
        icon: Icon(Icons.add_shopping_cart_rounded,color: Colors.black,), 
        label: GetX<CartController>(
          builder: (controller) {
            return Text(controller.count.toString(),style: TextStyle(color: Colors.black,fontSize: 24),);
          }
        )
        ),
        //whenever the count updates, we don't have to update entire floating action button, should update the text only.
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context,index){
                      return Card(
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),),
                                      Text('${controller.products[index].productDescription}',
                                      style: TextStyle(fontSize: 18),),
                                      Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24),),
                                    ],
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  cartController.addToCart(
                                    controller.products[index]
                                  );
                                }, 
                                child: Text("Add to Cart",),
                                ),
                                Obx(() => IconButton(
                                  onPressed: (){
                                    controller.products[index].isFavorite.toggle();
                                  },
                                  icon: controller.products[index].isFavorite.value
                                  ?Icon(Icons.check_box_rounded)
                                  :Icon(Icons.check_box_outline_blank_outlined),
                                  ))
                            ],
                          ),
                          ),
                      );
                    });
                }
              )
              ),
              Obx(() {
                return Text("Total Amount: \$ ${cartController.totalPrice}",style: TextStyle(fontSize: 18,color: Colors.white));
              }),
              //no other extra parameters, no builder, no controller returning back. It just wraps your widget with the reactive approach whenever the change happening it will be update UI.
              //obx is helpful when you have instance already with you. You know, what controller you have to work that time it will be helpful.
              // GetBuilder<CartController>(
              //   builder:(controller){
              //     return Text("Total Amount: \$ ${controller.testAmount}",style: TextStyle(fontSize: 18,color: Colors.white));
              //   },),
                // GetX<CartController>(
                //   builder: (controller) {
                //     return Text("Total Amount: \$ ${controller.totalPrice}",style: TextStyle(fontSize: 18,color: Colors.white));
                //   }
                // ),
                //make it listenable
                SizedBox(height: 100),
          ],
        )
        ),
    );
  }
}