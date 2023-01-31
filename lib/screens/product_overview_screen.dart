import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

import '../widget/products_grid.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favourites) {
                    // productsContainer.showfavouritesOnly();
                    _showOnlyFavourites = true;
                  } else {
                    // productsContainer.showAll();
                    _showOnlyFavourites = false;
                  }
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Only Favourite'),
                  value: FilterOptions.Favourites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        body: ProductsGrid(_showOnlyFavourites));
  }
}
