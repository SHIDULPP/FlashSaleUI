import 'package:flash_sale_app/screens/flash_sale_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()..loadProducts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FlashSaleScreen(),
      ),
    ),
  );
}
