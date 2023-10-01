import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Models/Category.dart';
import '../../Providers/AllProductListProvider.dart';
import '../../Providers/ProductCategoryListProvider.dart';
import 'AppSearchBar.dart';

class CategoryAlertDialog extends ConsumerStatefulWidget {
  final Category selectedCategory;
  final Function(Category) onCategorySelection;
  final FocusNode focus;
  final TextEditingController categorySearchController =
      TextEditingController();

  CategoryAlertDialog(
      this.selectedCategory, this.onCategorySelection, this.focus, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CategoryAlertDialogState();
}

class CategoryAlertDialogState extends ConsumerState<CategoryAlertDialog> {
  @override
  void initState() {
    widget.categorySearchController.text = ref.read(categorySearchTextProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var filteredCategoryList =
        ref.watch(searchableProductCategoryListProvider).value ?? [];
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AlertDialog(
        scrollable: true,
        elevation: 20,
        content: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    width: 250,
                    child: AppSearchBar(
                      myFocus: widget.focus,
                      searchController: widget.categorySearchController,
                      onSearch: (value) {
                        ref
                            .read(categorySearchTextProvider.notifier)
                            .update((state) => value);
                      },
                      hintText: 'Search Category',
                      hintFontSize: 15,
                      textFontSize: 19,
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                    width: 250.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredCategoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            filteredCategoryList[index].name!,
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.tertiary),
                          ),
                          onTap: () {
                            ref
                                .read(categorySearchTextProvider.notifier)
                                .update((state) => "");
                            widget.onCategorySelection(
                                filteredCategoryList[index]);
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        );
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
