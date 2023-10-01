import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/PresentableProduct.dart';
import 'HomeProductListProvider.dart';
import 'ProductNotifierProvider.dart';

final categorySearchTextProvider = StateProvider<String>((ref) => "");

final allProductListSearchedTextProvider = StateProvider<String>((ref) => "");

final allProductListProvider =
    FutureProvider<(bool, List<PresentableProduct>)>((ref) {
  var searchedText = ref.watch(allProductListSearchedTextProvider);
  var productListNotifier = ref.watch(productNotifierProvider.notifier);
  productListNotifier.fetchProductList();
  var productListProvider = ref.watch(productNotifierProvider);
  ref.watch(refreshHomeScreenProvider);

  var filteredList = productListProvider;

  if (searchedText != "" && searchedText.length > 0) {
    filteredList = filteredList.where((element) {
      return (element.category.name
                  ?.toLowerCase()
                  .contains(searchedText.toLowerCase()) ??
              false) ||
          (element.product.title
                  ?.toLowerCase()
                  .contains(searchedText.toLowerCase()) ??
              false) ||
          (element.product.subTitle
                  ?.toLowerCase()
                  .contains(searchedText.toLowerCase()) ??
              false);
    }).toList();
  }
  return (productListProvider.length > 0, filteredList);
});
