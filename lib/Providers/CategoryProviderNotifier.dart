import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/Category.dart';
import 'CoreProviders/CategoryListProvider.dart';

final categoryNotifierProvider =
    StateNotifierProvider<CategoryNotifier, List<Category>>((ref) {
  return CategoryNotifier(CategoryListProviderImpl());
});

class CategoryNotifier extends StateNotifier<List<Category>> {
  final CategoryListProvider _categoryProvider;

  CategoryNotifier(this._categoryProvider) : super(const <Category>[]);

  Future<void> fetchCategories() async {
    if (state.isEmpty) {
      this.updateCategoryList();
    }
  }

  Future<void> updateCategoryList() async {
    final categories = await _categoryProvider.getCategoryList();
    state = categories;
  }
}
