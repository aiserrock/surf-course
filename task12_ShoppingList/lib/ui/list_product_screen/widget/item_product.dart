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
              _icon(),
              const SizedBox(width: 12),
              _textContent(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textContent(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (item.amount is Quantity)
                Text(
                  '${item.amount.value.toString()} ${StringRes.pieces}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              if (item.amount is Grams)
                Text(
                  '${(item.amount.value / 1000).toString()} ${StringRes.kg}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              const Spacer(),
              Text(
                '${splitBy(item.price)} ${StringRes.rub}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      decoration: item.sale != 0 ? TextDecoration.lineThrough : null,
                      color: item.sale != 0 ? Theme.of(context).colorScheme.tertiary : null,
                    ),
              ),
              const SizedBox(width: 16),
              if (item.sale != 0) ...[
                Text(
                  '${splitBy(item.price * item.sale ~/ 100)} ${StringRes.rub}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
                const SizedBox(width: 16),
              ]
            ],
          ),
        ],
      ),
    );
  }

  Widget _icon() {
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
