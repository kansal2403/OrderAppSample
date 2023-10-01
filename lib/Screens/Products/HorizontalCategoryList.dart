import 'package:flutter/material.dart';
import '../../Models/Category.dart';

class HorizontalCategoryList extends StatefulWidget {
  final List<Category> categoryList;
  final Function(int) onSelect;
  final int selectedCategoryIndex;

  const HorizontalCategoryList({
    Key? key,
    required this.categoryList,
    required this.selectedCategoryIndex,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<HorizontalCategoryList> createState() => _HorizontalCategoryListState();
}

class _HorizontalCategoryListState extends State<HorizontalCategoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.categoryList.length,
      separatorBuilder: (context, _) => const SizedBox(
        width: 8,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          widget.onSelect(index);
        },
        child: circularCard(
            widget.categoryList[index], index == widget.selectedCategoryIndex),
      ),
    );
  }

  Widget circularCard(Category category, bool isSelected) {
    final backgroundColor = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.background;
    final allSelectedColor = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onTertiary;
    return Column(
      children: [
        (category.name == "All")
            ? _allCategoryWidget(allSelectedColor, category)
            : _imageCategoryWidget(backgroundColor, category),
        _categoryTitle(category)
      ],
    );
  }

  Widget _imageCategoryWidget(Color backgroundColor, Category category) {
    return CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 30,
        child: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(category.imageDisplayUrl!),
        ));
  }

  Widget _allCategoryWidget(Color allSelectedColor, Category category) {
    return Column(children: [
      Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
            border: Border.all(
              color: allSelectedColor,
              width: 2,
            )),
        child: Center(
          child: Text(
            "All",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: allSelectedColor),
          ),
        ),
      ),
      const SizedBox(
        height: 2,
      ),
    ]);
  }

  Widget _categoryTitle(Category category) {
    return Text(
      category.name.toString(),
      style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary, fontSize: 14),
    );
  }
}
