import 'package:surf_flutter_courses_template/domain/products_model.dart';

///сортировка по цене по убыванию
List<ProductEntity> lowToHighPrice(List<ProductEntity> products) =>
    products..sort((a, b) => a.price.compareTo(b.price));

///сортировка по цене по возрастанию
List<ProductEntity> highToLowPrice(List<ProductEntity> products) =>
    products..sort((a, b) => b.price.compareTo(a.price));

///сортировка по имени от А до Я
List<ProductEntity> alphabetFromA(List<ProductEntity> products) =>
    products..sort((a, b) => a.title.compareTo(b.title));

///сортировка по имени от Я до А
List<ProductEntity> alphabetToA(List<ProductEntity> products) =>
    products..sort((a, b) => b.title.compareTo(a.title));

///сортировка по типу от А до Я
List<ProductEntity> typeFromA(List<ProductEntity> products) =>
    products..sort((a, b) => a.category.name.compareTo(b.category.name));

///сортировка по типу от Я до А
List<ProductEntity> typeToA(List<ProductEntity> products) =>
    products..sort((a, b) => b.category.name.compareTo(a.category.name));
