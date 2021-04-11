import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_item_model.dart';

class ShoppingHomePageListContent extends StatelessWidget {
  final List<ShoppingItemModel> items;

  const ShoppingHomePageListContent({Key? key, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _ShoppingHomeListItem(item: item);
      },
    );
  }
}

class _ShoppingHomeListItem extends StatelessWidget {
  final ShoppingItemModel item;

  const _ShoppingHomeListItem({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(item.name);
  }
}
