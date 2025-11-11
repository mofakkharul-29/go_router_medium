import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/constant/router_name.dart';
import 'package:routing/model/product_model.dart';
import 'package:routing/repository/providers/product/api/product_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList = ref.watch(productProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: productsList.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text(
                'No Product Yet!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            );
          }

          return GridView.builder(
            itemCount: data.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
            itemBuilder: (context, index) {
              final product = data[index];
              return getProduct(product, context);
            },
          );
        },
        error: (error, stackTrace) {
          debugPrint('========error found: $error');
          return Center(
            child: Text(
              'Error loading products!',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
        loading: () => Center(
          child: CupertinoActivityIndicator(
            color: Colors.black,
            radius: 15,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white70,
        splashColor: Colors.amber[200],
        onPressed: () {
          ref.read(productProvider.notifier).fetchProduct();
        },
        child: Icon(
          Icons.download_outlined,
          size: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget getProduct(
    ProductModel product,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        final productId = product.id;
        debugPrint('Product clicked===========');
        if (context.mounted) {
          context.push(
            '/$mainScreenRouteName/product-details/$productId',
          );
        }
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Image.network(
                  product.photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                product.details,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '\$${product.priceNew}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '\$${product.priceOld}',
                    style: TextStyle(
                      decoration:
                          TextDecoration.lineThrough,
                      color: Colors.red[400],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
