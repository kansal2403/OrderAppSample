import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/Category.dart';
import 'AllProductListProvider.dart';
import 'ProductNotifierProvider.dart';

//Filtering all the Categories related to products and showing on the Home Scren
final productCategoryListProvider = FutureProvider<List<Category>>((ref) {
  var productList = ref.watch(productNotifierProvider);

  List<Category> productCategories = [];
  productList.forEach((element) {
    if (!(productCategories
        .map((e) => e.name)
        .contains(element.category.name))) {
      productCategories.add(element.category);
    }
  });
  productCategories.insert(0, Category(name: "All"));
  return productCategories;
});

final searchableProductCategoryListProvider = FutureProvider<List<Category>>((ref) {
  var productCategoryList = ref.watch(productCategoryListProvider);
  var searchedText = ref.watch(categorySearchTextProvider);

  List<Category> filteredCategories = [];
  productCategoryList.value?.forEach((element) {
    if (element.name?.toLowerCase().contains(searchedText.toLowerCase()) ?? false) {
      filteredCategories.add(element);
    }
  });
  return filteredCategories;
});