import '../Models/PresentableProduct.dart';

class ProductInfoProvider {
  static String productDisplayTitle(PresentableProduct product) {
    if ((product.product.subTitle?.length ?? 0) > 0) {
      return "${product.product.title.toString()} (${product.product.subTitle.toString()})";
    } else {
      return "${product.product.title.toString()}";
    }
  }
}