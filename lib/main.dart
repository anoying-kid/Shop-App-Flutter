import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';

import './providers/products.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.deepOrange
          )
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => const ProductDetailScreen() 
        },
      ),
    );
  }
}
