import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/PresentableProduct.dart';
import 'ProductCategoryListProvider.dart';
import 'ProductNotifierProvider.dart';
import '../Models/Category.dart' as local;

//Used when Coming back from Cart Screen to home Screen, to refresh the List
final refreshHomeScreenProvider = StateProvider<bool>((ref) => false);

final homeScreenSearchedTextProvider = StateProvider<String>((ref) => "");

final selectedCategoryProvider =
    StateProvider<local.Category>((ref) => local.Category(name: "All"));

final selectedCategoryIndexProvider = StateProvider<int>((ref) {
  var selectedCategory = ref.watch(selectedCategoryProvider);
  var categoryListProvider = ref.watch(productCategoryListProvider).value;
  for (int index = 0; index < (categoryListProvider?.length ?? 0); index++) {
    if (categoryListProvider?[index].name == selectedCategory.name) {
      return index;
    }
  }
  return 0;
});

final homeProductListProvider =
    FutureProvider<(bool, List<PresentableProduct>)>((ref) {
  var selectedCategory = ref.watch(selectedCategoryProvider);
  var searchedText = ref.watch(homeScreenSearchedTextProvider);
  var productListNotifier = ref.watch(productNotifierProvider.notifier);
  productListNotifier.fetchProductList();
  var productListProvider = ref.watch(productNotifierProvider);
  ref.watch(refreshHomeScreenProvider);

  var filteredList = productListProvider;
  if (selectedCategory.name != 'All') {
    print("In Category Filter Block");
    filteredList = filteredList
        .where((element) => element.category.name == selectedCategory.name)
        .toList();
  }

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
