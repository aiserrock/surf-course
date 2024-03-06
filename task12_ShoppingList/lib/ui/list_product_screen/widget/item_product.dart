import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/products_model.dart';
import 'package:surf_flutter_courses_template/style/strings.dart';
import 'package:surf_flutter_courses_template/util/money_formatter.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({
    required this.item,
    required this.isFirstItem,
    super.key,
  });

  final ProductEntity item;
  final bool isFirstItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isFirstItem) ...[
            Text(' ${item.category.name}'),
            const SizedBox(
              height: 16,
            )
          ],
          Row(
            children: [
              _IconWidget(item: item),
              const SizedBox(width: 12),
              _TextContent(item: item),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconWidget extends StatelessWidget {
  const _IconWidget({
    required this.item,
  });

  final ProductEntity item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 68,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          item.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({
    required this.item,
  });

  final ProductEntity item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isItemSaleNotZero = item.sale != 0;
    final sale = item.price * item.sale ~/ 100;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: theme.displayMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (item.amount is Quantity)
                Text(
                  '${item.amount.value.toString()} ${StringRes.pieces}',
                  style: theme.displayMedium,
                ),
              if (item.amount is Grams)
                Text(
                  '${(item.amount.value / 1000).toString()} ${StringRes.kg}',
                  style: theme.displayMedium,
                ),
              const Spacer(),
              Text(
                '${splitBy(item.price)} ${StringRes.rub}',
                style: theme.bodySmall?.copyWith(
                  decoration: isItemSaleNotZero ? TextDecoration.lineThrough : null,
                  color: isItemSaleNotZero ? Theme.of(context).colorScheme.tertiary : null,
                ),
              ),
              const SizedBox(width: 16),
              if (isItemSaleNotZero) ...[
                Text(
                  '${splitBy(sale)} ${StringRes.rub}',
                  style: theme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
                const SizedBox(width: 16),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
