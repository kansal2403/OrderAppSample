import 'package:flutter/material.dart';
import '../../Helpers/Styles/AppBorders.dart';
import '../../Models/PresentableProduct.dart';
import '../../Providers/ProductInfoProvider.dart';

class ProductInfoCard extends StatelessWidget {
  final PresentableProduct _productInfo;
  final Function(int) _onQuantityChange;
  final bool isHomeView;

  const ProductInfoCard(this._productInfo, this._onQuantityChange,
      {super.key, required this.isHomeView});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shape: AppBorders.itemCardBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  CircleAvatar(
                    radius: 30,
                      backgroundImage: AssetImage(_productInfo.product.imageDisplayUrl!)
                  ),
                  const Spacer(),
                  isHomeView ? quantityCounter(context) : productPrice(context),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Text(
                _productInfo.category.name.toString(),
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onTertiary),
              ),
              Text(
                ProductInfoProvider.productDisplayTitle(_productInfo),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const Spacer()
            ],
          ),
        ),
      );
  }

  Widget productPrice(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Column(
          children: [const Spacer(), priceSection(context), const Spacer()],
        ));
  }

  Column quantityCounter(BuildContext context) {
    return Column(
      children: [
        priceSection(context),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisSize: MainAxisSize.min, children: [
          InkWell(
            onTap: () {
              if (_productInfo.selectedQuantity > 0) {
                _onQuantityChange(_productInfo.selectedQuantity - 1);
              }
            },
            child: plusMinusButton(
                Icon(Icons.remove,
                    color: Theme.of(context).colorScheme.onSecondary),
                context),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 25),
            child: Text(
              _productInfo.selectedQuantity.toString(),
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {
              _onQuantityChange(_productInfo.selectedQuantity + 1);
            },
            child: plusMinusButton(
                Icon(Icons.add,
                    color: Theme.of(context).colorScheme.onSecondary),
                context),
          ),
        ]),
      ],
    );
  }

  Widget priceSection(BuildContext context) {
    if (_productInfo.product.price.toString() ==
        _productInfo.product.discountedPrice.toString()) {
      return Text("Rs.${_productInfo.product.price.toString()}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ));
    } else {
      return Column(
        children: [
          Text("Rs.${_productInfo.product.discountedPrice.toString()}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
          const SizedBox(
            height: 3,
          ),
          Text("Rs.${_productInfo.product.price.toString()}",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  decoration: TextDecoration.lineThrough))
        ],
      );
    }
  }

  Widget plusMinusButton(Icon icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: icon,
      ),
    );
  }
}
