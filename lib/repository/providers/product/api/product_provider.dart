import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:routing/model/product_model.dart';
import 'package:routing/repository/dio_config/dio_client.dart';

class ProductNotifier
    extends StateNotifier<AsyncValue<List<ProductModel>>> {
  final DioClient _dioClient;
  ProductNotifier(this._dioClient)
    : super(AsyncValue.data([]));

  Future<void> fetchProduct() async {
    state = AsyncValue.loading();

    try {
      final response = await _dioClient.getData(
        '/products',
      );
      final List<ProductModel> products =
          (response.data as List)
              .map((json) => ProductModel.fromJson(json))
              .toList();
      debugPrint(
        'Products fetched successfully: ${products.length}',
      );
      state = AsyncValue.data(products);
    } catch (e, st) {
      debugPrint(
        'Error fetching products: $e ====stateTrace is : $st',
      );
      state = AsyncValue.error(e, st);
    }
  }

  Future<ProductModel> getById(String id) async {
    try {
      final response = await _dioClient.getProductById(
        '/products/$id',
      );
      debugPrint(
        'product fetch by id=======: ${response.data}',
      );
      final ProductModel product = ProductModel.fromJson(
        response.data,
      );
      return product;
    } catch (e, st) {
      debugPrint('problem getting product by id: $e');
      throw Exception(
        'problem getting product $e and stractrace is $st',
      );
    }
  }
}

final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(),
);

final productProvider =
    StateNotifierProvider<
      ProductNotifier,
      AsyncValue<List<ProductModel>>
    >((ref) {
      final dioClient = ref.watch(dioClientProvider);
      return ProductNotifier(dioClient);
    });
