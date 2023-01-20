import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductsOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // listeners
    final productsContainer = Provider.of<Products>(context);
    final products = productsContainer.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('EShop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (c) => products[i],
          child: ProductItem(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
