import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/model/product_model.dart';
import 'package:routing/repository/providers/product/api/product_provider.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final String productId;
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Received product id: $productId',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              final ProductModel product = await ref
                  .read(productProvider.notifier)
                  .getById(productId);

              final extra = <String, dynamic>{
                'name': product.name,
                'details': product.details,
                'previousPrice': product.priceOld,
                'newPrice': product.priceNew,
                'image': product.photoUrl,
              };

              if (context.mounted) {
                context.push(
                  '/main/product-details/$productId/product-purchase',
                  extra: extra,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black,
              minimumSize: Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(
                  4,
                ),
              ),
            ),
            child: const Text(
              'Buy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
