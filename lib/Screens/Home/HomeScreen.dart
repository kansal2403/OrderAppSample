import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Products/HomeProductListScreen.dart';
import '../Cart/CartScreen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order App Sample'),
        actions: [
          Builder(builder: (context) {
            return Container(
                width: 80,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.shopping_cart),
                ));
          })
        ],
      ),
      endDrawer: const CartScreen(),
      body: ProductListScreen(
        'All Products',
      ),
    );
  }
}
