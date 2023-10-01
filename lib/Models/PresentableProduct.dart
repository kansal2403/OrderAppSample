import 'Category.dart';
import 'Product.dart';

class PresentableProduct {
  late Product product;
  late Category category;
  int selectedQuantity = 0;

  PresentableProduct(this.category, this.product);

  PresentableProduct.fromInfo(Map<String, dynamic> info) {
    var categoriesData = info['categories'] as Map<String, dynamic>;
    product = Product.fromJson(info);
    category = Category.fromJson(categoriesData);
  }

  Product toProduct() {
    return Product(
        categoryId: category.id,
        title: product.title,
        subTitle: product.subTitle,
        price: product.price,
        discountedPrice: product.discountedPrice);
  }

  static var testProducts = [
    PresentableProduct(
      Category(
        name: "Pizza",
        imageDisplayUrl: "assets/images/pizza.jpg",
        imageBucketPath: "bucket/pizza.jpg",
        id: "cat7",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod13",
        imageBucketPath: "bucket/pizza5.jpg",
        imageDisplayUrl: "assets/images/pizza.jpg",
        discountedPrice: 9.99,
        categoryId: "cat7",
        price: 14.99,
        subTitle: "Delicious Margherita",
        title: "Margherita Pizza",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Pizza",
        imageDisplayUrl: "assets/images/pizza.jpg",
        imageBucketPath: "bucket/pizza.jpg",
        id: "cat7",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod14",
        imageBucketPath: "bucket/pizza6.jpg",
        imageDisplayUrl: "assets/images/pizza.jpg",
        discountedPrice: 10.99,
        categoryId: "cat7",
        price: 16.99,
        subTitle: "Spicy Pepperoni",
        title: "Pepperoni Pizza",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Pizza",
        imageDisplayUrl: "assets/images/pizza.jpg",
        imageBucketPath: "bucket/pizza.jpg",
        id: "cat7",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod15",
        imageBucketPath: "bucket/pizza7.jpg",
        imageDisplayUrl: "assets/images/pizza.jpg",
        discountedPrice: 11.99,
        categoryId: "cat7",
        price: 18.99,
        subTitle: "Veggie Delight",
        title: "Vegetarian Pizza",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Pizza",
        imageDisplayUrl: "assets/images/pizza.jpg",
        imageBucketPath: "bucket/pizza.jpg",
        id: "cat7",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod16",
        imageBucketPath: "bucket/pizza8.jpg",
        imageDisplayUrl: "assets/images/pizza.jpg",
        discountedPrice: 12.99,
        categoryId: "cat7",
        price: 19.99,
        subTitle: "Meat Lover's Choice",
        title: "Meat Lovers Pizza",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Burger",
        imageDisplayUrl: "assets/images/burger.jpg",
        imageBucketPath: "bucket/burger.jpg",
        id: "cat5",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod8",
        imageBucketPath: "bucket/burger1.jpg",
        imageDisplayUrl: "assets/images/burger.jpg",
        discountedPrice: 7.99,
        categoryId: "cat5",
        price: 10.99,
        subTitle: "Classic Cheeseburger",
        title: "Cheeseburger",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Burger",
        imageDisplayUrl: "assets/images/burger.jpg",
        imageBucketPath: "bucket/burger.jpg",
        id: "cat5",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod9",
        imageBucketPath: "bucket/burger2.jpg",
        imageDisplayUrl: "assets/images/burger.jpg",
        discountedPrice: 8.99,
        categoryId: "cat5",
        price: 12.99,
        subTitle: "Spicy Chicken Burger",
        title: "Chicken Burger",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Burger",
        imageDisplayUrl: "assets/images/burger.jpg",
        imageBucketPath: "bucket/burger.jpg",
        id: "cat5",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod10",
        imageBucketPath: "bucket/burger3.jpg",
        imageDisplayUrl: "assets/images/burger.jpg",
        discountedPrice: 9.99,
        categoryId: "cat5",
        price: 13.99,
        subTitle: "Veggie Burger Delight",
        title: "Veggie Burger",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Burger",
        imageDisplayUrl: "assets/images/burger.jpg",
        imageBucketPath: "bucket/burger.jpg",
        id: "cat5",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod11",
        imageBucketPath: "bucket/burger4.jpg",
        imageDisplayUrl: "assets/images/burger.jpg",
        discountedPrice: 10.99,
        categoryId: "cat5",
        price: 15.99,
        subTitle: "Double Patty Delight",
        title: "Double Patty Burger",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Ice Cream",
        imageDisplayUrl: "assets/images/icecream.jpg",
        imageBucketPath: "bucket/icecream.jpg",
        id: "cat8",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod17",
        imageBucketPath: "bucket/icecream1.jpg",
        imageDisplayUrl: "assets/images/icecream.jpg",
        discountedPrice: 3.99,
        categoryId: "cat8",
        price: 5.99,
        subTitle: "Vanilla Delight",
        title: "Vanilla Ice Cream",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Ice Cream",
        imageDisplayUrl: "assets/images/icecream.jpg",
        imageBucketPath: "bucket/icecream.jpg",
        id: "cat8",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod18",
        imageBucketPath: "bucket/icecream2.jpg",
        imageDisplayUrl: "assets/images/icecream.jpg",
        discountedPrice: 4.99,
        categoryId: "cat8",
        price: 7.99,
        subTitle: "Chocolate Swirl",
        title: "Chocolate Ice Cream",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Ice Cream",
        imageDisplayUrl: "assets/images/icecream.jpg",
        imageBucketPath: "bucket/icecream.jpg",
        id: "cat8",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod19",
        imageBucketPath: "bucket/icecream3.jpg",
        imageDisplayUrl: "assets/images/icecream.jpg",
        discountedPrice: 5.99,
        categoryId: "cat8",
        price: 9.99,
        subTitle: "Strawberry Bliss",
        title: "Strawberry Ice Cream",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Ice Cream",
        imageDisplayUrl: "assets/images/icecream.jpg",
        imageBucketPath: "bucket/icecream.jpg",
        id: "cat8",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod20",
        imageBucketPath: "bucket/icecream4.jpg",
        imageDisplayUrl: "assets/images/icecream.jpg",
        discountedPrice: 4.99,
        categoryId: "cat8",
        price: 6.99,
        subTitle: "Minty Freshness",
        title: "Mint Chocolate Chip Ice Cream",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Drinks",
        imageDisplayUrl: "assets/images/drink.jpg",
        imageBucketPath: "bucket/drink.jpg",
        id: "cat9",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod21",
        imageBucketPath: "bucket/drink1.jpg",
        imageDisplayUrl: "assets/images/drink.jpg",
        discountedPrice: 1.99,
        categoryId: "cat9",
        price: 3.99,
        subTitle: "Refreshing Soda",
        title: "Cola",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Drinks",
        imageDisplayUrl: "assets/images/drink.jpg",
        imageBucketPath: "bucket/drink.jpg",
        id: "cat9",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod22",
        imageBucketPath: "bucket/drink2.jpg",
        imageDisplayUrl: "assets/images/drink.jpg",
        discountedPrice: 2.49,
        categoryId: "cat9",
        price: 4.99,
        subTitle: "Citrus Zest",
        title: "Lemonade",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Drinks",
        imageDisplayUrl: "assets/images/drink.jpg",
        imageBucketPath: "bucket/drink.jpg",
        id: "cat9",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod23",
        imageBucketPath: "bucket/drink3.jpg",
        imageDisplayUrl: "assets/images/drink.jpg",
        discountedPrice: 1.99,
        categoryId: "cat9",
        price: 3.99,
        subTitle: "Iced Tea",
        title: "Peach Iced Tea",
      ),
    ),
    PresentableProduct(
      Category(
        name: "Drinks",
        imageDisplayUrl: "assets/images/drink.jpg",
        imageBucketPath: "bucket/drink.jpg",
        id: "cat9",
        userId: "user123",
      ),
      Product(
        userId: "user123",
        id: "prod24",
        imageBucketPath: "bucket/drink4.jpg",
        imageDisplayUrl: "assets/images/drink.jpg",
        discountedPrice: 2.99,
        categoryId: "cat9",
        price: 5.99,
        subTitle: "Caffeine Boost",
        title: "Iced Coffee",
      ),
    ),
  ];
}
