import '../../Models/Category.dart';

abstract class CategoryListProvider {
  Future<List<Category>> getCategoryList();
}

class CategoryListProviderImpl implements CategoryListProvider {

  @override
  Future<List<Category>> getCategoryList() async {
    List<Category> categoriesList = [];
    return categoriesList;
  }
}
