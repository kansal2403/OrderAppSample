import '../../Models/PresentableProduct.dart';

abstract class ProductListProvider {
  Future<List<PresentableProduct>> getProductList();
}

class ProductListProviderImpl implements ProductListProvider {

  List<PresentableProduct> _productList = [];

  @override
  Future<List<PresentableProduct>> getProductList() async {
    _productList = PresentableProduct.testProducts;
   return _productList;
  }
}
