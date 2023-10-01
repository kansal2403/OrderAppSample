class Product {
  String? id;
  String? userId;
  String? categoryId;
  String? title;
  String? subTitle;
  String? imageDisplayUrl;
  String? imageBucketPath;
  num? price;
  num? discountedPrice;

  Product(
      {this.id,
      this.userId,
      this.categoryId,
      this.title,
      this.subTitle,
      this.imageDisplayUrl,
      this.imageBucketPath,
      this.price,
      this.discountedPrice});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    categoryId = json['categoryId'];
    title = json['title'];
    subTitle = json['subTitle'];
    imageDisplayUrl = json['imageDisplayUrl'];
    imageBucketPath = json['imageBucketPath'];
    price = json['price'];
    discountedPrice = json['discountedPrice'];
  }
}
