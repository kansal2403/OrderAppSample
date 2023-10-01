import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_app_sample/Helpers/AppToast.dart';
import '../../Helpers/PrimaryButton.dart';
import '../../Helpers/ProgressView.dart';
import '../../Helpers/Styles/TextStyles.dart';
import '../../Models/PresentableProduct.dart';
import '../../Providers/CartItemListProvider.dart';
import '../../Providers/HomeProductListProvider.dart';
import '../../Providers/ProductNotifierProvider.dart';
import 'CartItemCard.dart';

class CartScreen extends ConsumerStatefulWidget {

  const CartScreen( {super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    var asyncCartItems = ref.watch(cartItemListProvider);
    var cartDiscount = ref.watch(cartDiscountInfoProvider);
    return SafeArea(
      bottom: false,
      child: Drawer(
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).colorScheme.onBackground,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.primary,
                    child: Row(
                      children: [
                        const Spacer(),
                        Center(
                          child: Text("Cart Items",
                              style: TextStyles.titleLarge28()),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  asyncCartItems.when(data: (cartItems) {
                    return Flexible(
                        child: cartItemsList(cartItems, cartDiscount));
                  }, error: (error, trace) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }, loading: () {
                    return const Center(
                      child: Text("Error"),
                    );
                  }),
                ],
              ),
            ),
            showProgress(),
          ],
        ),
      ),
    );
  }

  Widget showProgress() {
    if (_showProgress) {
      return ProgressView.showProgress();
    } else {
      return Container();
    }
  }

  Widget cartItemsList(
      List<PresentableProduct> cartItems, double cartDiscount) {
    if (cartItems.isNotEmpty) {
      return Container(
        color: Theme.of(context).colorScheme.background,
        width: 300,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        cartItems[index],
                        (p0) => {
                          setState(() {
                            cartItems[index].selectedQuantity = p0;
                            if (p0 == 0) {
                              ref
                                  .read(updateCartListProvider.notifier)
                                  .update((state) => !state);
                            }
                          }),
                        },
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              Text("Sub Total: Rs. ${cartTotal(cartItems).toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              const SizedBox(
                height: 8,
              ),
              Text("Total: Rs. ${(cartTotal(cartItems) - cartDiscount).toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                    onTap: () {
                      _clearCartAndUpdateProviders(ref);
                    },
                    name: "CheckOut"),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: Theme.of(context).colorScheme.background,
        width: 300,
        child: const Center(
            child: Text(
          "No Item In Cart!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )),
      );
    }
  }


  double cartTotal(List<PresentableProduct> cartItems) {
    double _cartTotalPrice = 0;
    for (var cartItem in cartItems) {
      _cartTotalPrice +=
          cartItem.product.discountedPrice! * cartItem.selectedQuantity;
    }
    return _cartTotalPrice;
  }

  void _clearCartAndUpdateProviders(WidgetRef ref) {
    ref
        .read(productNotifierProvider)
        .where((element) => element.selectedQuantity > 0)
        .forEach((element) {
      element.selectedQuantity = 0;
    });

    ref.read(updateCartListProvider.notifier).update((state) => !state);
    ref.read(refreshHomeScreenProvider.notifier).update((state) => !state);
    setState(() {
      _showProgress = false;
    });
    AppToast.showToast("Order Completed");
  }
}
