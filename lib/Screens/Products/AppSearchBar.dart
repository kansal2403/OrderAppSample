import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode? myFocus;
  final double? hintFontSize;
  final double? textFontSize;
  final double? iconSize;
  final String hintText;
  final Function(String) onSearch;
  final String? Function(String?)? validator;

  const AppSearchBar(
      {Key? key,
      required this.searchController,
      this.myFocus,
      required this.onSearch,
      this.validator,
      this.hintFontSize,
      this.iconSize,
      required this.hintText,
      this.textFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.sentences,
        textAlignVertical: TextAlignVertical.center,
        focusNode: myFocus,
        style: TextStyle(fontSize: textFontSize),
        validator: validator,
        onChanged: (value) {
          onSearch(value);
        },
        controller: searchController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onTertiary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: hintFontSize),
          suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                size: (iconSize != null) ? iconSize : 20,
                color: (myFocus != null)
                    ? (myFocus!.hasFocus
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onTertiary)
                    : null,
              ),
              onPressed: () {
                searchController.clear();
                onSearch(searchController.text);
              }),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 20,
              color: (myFocus != null)
                  ? (myFocus!.hasFocus
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onTertiary)
                  : null,
            ),
            onPressed: () {
              onSearch(searchController.text);
            },
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ));
  }
}
