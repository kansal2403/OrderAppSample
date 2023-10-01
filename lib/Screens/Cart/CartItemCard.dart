import 'package:flutter/material.dart';
import '../../Helpers/Styles/AppBorders.dart';
import '../../Models/PresentableProduct.dart';
import '../../Providers/ProductInfoProvider.dart';

class CartItemCard extends StatelessWidget {
  final PresentableProduct _cartItem;
  final Function(int) _onQuantityChange;

  const CartItemCard(this._cartItem, this._onQuantityChange, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shape: AppBorders.itemCardBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(children: [
                    CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(_cartItem.category.imageDisplayUrl!),
                  ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _cartItem.category.name.toString(),
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                          ),
                          Text(
                              ProductInfoProvider.productDisplayTitle(
                                  _cartItem),
                              maxLines: 2,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  ]),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onTertiary)),
                    child: InkWell(
                      onTap: () {
                        _onQuantityChange(_cartItem.selectedQuantity = 0);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Theme.of(context).colorScheme.onTertiary,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
              const SizedBox(height: 4),
              Row(
                children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    InkWell(
                      onTap: () {
                        if (_cartItem.selectedQuantity > 0) {
                          _onQuantityChange(_cartItem.selectedQuantity - 1);
                        }
                      },
                      child: plusMinusButton(
                          Icon(
                            Icons.remove,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          context),
                    ),
                    Container(
                      constraints: BoxConstraints(minWidth: 30),
                      child: Text(
                        '${_cartItem.selectedQuantity}',
                        style: const TextStyle(fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _onQuantityChange(_cartItem.selectedQuantity + 1);
                      },
                      child: plusMinusButton(
                          Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          context),
                    )
                  ]),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${_cartItem.product.discountedPrice.toString()} X ${_cartItem.selectedQuantity}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text("Total Price",
                      //     style: TextStyle(
                      //       color: Theme.of(context).colorScheme.tertiary,
                      //     )),
                      Text("Rs. ${calculateTotalPrice().toString()}",
                          style: TextStyle(

                            color: Theme.of(context).colorScheme.tertiary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }

  Widget plusMinusButton(Icon icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: icon,
      ),
    );
  }

  num calculateTotalPrice() {
    return (_cartItem.product.discountedPrice! * _cartItem.selectedQuantity);
  }
}
