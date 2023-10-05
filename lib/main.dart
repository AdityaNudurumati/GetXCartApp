import 'package:flutter/material.dart';
import 'package:getx_cart/views/shopping_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ShoppingPage(),
      ),
    );
  }
}