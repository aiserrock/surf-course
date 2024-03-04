import 'package:surf_flutter_courses_template/domain/products_model.dart';

CountSale countSale({
  required List<ProductEntity> dataForStudents,
}) {
  var total = 0;
  var totalSalePercent = 0;
  var totalSaleRub = 0;
  var totalPriceWithSale = 0;

  for (final product in dataForStudents) {
    total += product.price;
    totalSalePercent += product.sale.toInt();
    if (product.sale != 0) {
      totalSaleRub = (product.price * product.sale ~/ 100);
    }
    totalPriceWithSale = total - totalSaleRub;
  }
  return CountSale(
    total: total,
    totalSalePercent: totalSalePercent,
    totalSaleRub: totalSaleRub,
    totalPriceWithSale: totalPriceWithSale,
  );
}

class CountSale {
  CountSale({
    required this.totalSalePercent,
    required this.totalSaleRub,
    required this.totalPriceWithSale,
    required this.total,
  });

  final int totalSalePercent;
  final int totalSaleRub;
  final int totalPriceWithSale;
  final int total;
}
