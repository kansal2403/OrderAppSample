import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/PresentableProduct.dart';
import 'ProductNotifierProvider.dart';

final updateCartListProvider = StateProvider<bool>((ref) => false);

final cartItemListProvider =
    FutureProvider.autoDispose<List<PresentableProduct>>((ref) {
  ref.watch(updateCartListProvider);
  var productListProvider = ref.watch(productNotifierProvider);
  return productListProvider
      .where((element) => element.selectedQuantity > 0)
      .toList();
});

final cartDiscountInfoProvider = StateProvider.autoDispose<double>((ref) => 0.0);