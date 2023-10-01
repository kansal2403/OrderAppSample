import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/PresentableProduct.dart';
import 'CoreProviders/ProductListProvider.dart';

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<PresentableProduct>>((ref) {
  return ProductNotifier();
});

class ProductNotifier extends StateNotifier<List<PresentableProduct>> {
  ProductNotifier() : super([]);
  ProductListProvider _productListProvider = ProductListProviderImpl();

  Future<List<PresentableProduct>> fetchProductList() async {
    if (state.isNotEmpty) {
      return state;
    } else {
      final productList = await _productListProvider.getProductList();
      state = productList;
      return productList;
    }
  }
}
