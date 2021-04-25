import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_item_model.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';

class ShoppingHomePageListContent extends StatelessWidget {
  final List<ShoppingItemModel> items;

  const ShoppingHomePageListContent({Key? key, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _ShoppingHomeListItem(item: item);
        },
      ),
    );
  }
}

class _ShoppingHomeListItem extends StatelessWidget {
  final ShoppingItemModel item;

  const _ShoppingHomeListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: BaseCard(
        borderRadius: 8.0,
        child: Row(
          children: [
            const SizedBox(width: 48),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Figures", style: const TextStyle(fontSize: 14.0)),
                    const SizedBox(height: 2.0),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFB5B5B5),
                      ),
                    )
                  ]),
            ),
            const SizedBox(width: 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(item.amount.toString())],
            ),
            const SizedBox(width: 4),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }
}
