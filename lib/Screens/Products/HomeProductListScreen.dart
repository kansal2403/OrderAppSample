import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Helpers/PrimaryButton.dart';
import '../../Models/Category.dart';
import '../../Providers/HomeProductListProvider.dart';
import '../../Providers/ProductCategoryListProvider.dart';
import 'CategoryAlertDialog.dart';
import 'HorizontalCategoryList.dart';
import 'ProductInfoCard.dart';
import 'AppSearchBar.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  final String title;

  const ProductListScreen(this.title, {super.key});

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _myFocus = FocusNode();
  final FocusNode _categoryFocus = FocusNode();

  @override
  void initState() {
    _focus();
    _categoryFocusListener();
    super.initState();
  }

  void _focus() {
    _myFocus.addListener(() {
      setState(() {});
    });
  }

  void _categoryFocusListener() {
    _categoryFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var productListProvider = ref.watch(homeProductListProvider);
    var categoryListProvider = ref.watch(productCategoryListProvider);
    var categoryIndex = ref.watch(selectedCategoryIndexProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        color: Theme.of(context).colorScheme.onBackground,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  PrimaryButton(
                      name: "Category",
                      onTap: () {
                        showCategorySearchAlert(
                            categoryListProvider.value ?? [], categoryIndex);
                      }),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: AppSearchBar(
                        searchController: _searchController,
                        hintText: 'Search...',
                        myFocus: _myFocus,
                        hintFontSize: 18,
                        onSearch: (value) {
                          var searchTextProvider =
                              ref.read(homeScreenSearchedTextProvider.notifier);
                          searchTextProvider.update((state) => value);
                        },
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 100,
                    child: categoryListProvider.when(
                      data: (categoryList) {
                        return HorizontalCategoryList(
                            categoryList: categoryList,
                            selectedCategoryIndex: categoryIndex,
                            onSelect: (selectedIndex) {
                              var categoryProvider =
                                  ref.read(selectedCategoryProvider.notifier);
                              categoryProvider.update((state) => Category(
                                  name: categoryList[selectedIndex].name));
                            });
                      },
                      error: (error, trace) {
                        return const Text("Error in Loading categories");
                      },
                      loading: () {
                        return const Text("Loader");
                      },
                    )),
                productListProvider.when(
                  data: (productListInfo) {
                    if (productListInfo.$1 == false) {
                      return const Center(child: Text("Loading.."),);
                    } else {
                      return Expanded(
                        child: GridView.builder(
                            itemCount: productListInfo.$2.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 230,
                                    mainAxisExtent: 170,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductInfoCard(
                                isHomeView: true,
                                  productListInfo.$2[index],
                                  (p0) => {
                                        setState(() {
                                          productListInfo
                                              .$2[index].selectedQuantity = p0;
                                        }),
                                      });
                            }),
                      );
                    }
                  },
                  error: (error, trace) {
                    return const Center(
                      child: Text("Error Ayi h"),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: Text("Error Ayi h"),
                    );
                  },
                )
              ],
            )),
      ),
    );
  }

  void showCategorySearchAlert(List<Category> categoryList, int categoryIndex) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CategoryAlertDialog(categoryList[categoryIndex], (p0) {
            var categoryProvider = ref.read(selectedCategoryProvider.notifier);
            categoryProvider.update((state) => Category(name: p0.name));
          }, _categoryFocus);
        });
  }
}
