class Article {
  final int id;
  final String category;
  final String name;
  final int price;
  final int quantity;

  Article(this.id, this.category, this.name, this.price, this.quantity);

  @override
  String toString() {
    return '$id\t$category\t$name\t$price рублей\t$quantity шт';
  }
}

abstract class Filter {
  bool apply(Article article);
}

class CategoryFilter implements Filter {
  final String category;

  CategoryFilter(this.category);

  @override
  bool apply(Article article) {
    return article.category == category;
  }
}

class PriceFilter implements Filter {
  final int maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(Article article) {
    return article.price <= maxPrice;
  }
}

class QuantityFilter implements Filter {
  final int maxQuantity;

  QuantityFilter(this.maxQuantity);

  @override
  bool apply(Article article) {
    return article.quantity < maxQuantity;
  }
}

void applyFilter(List<Article> articles, Filter filter) {
  final filteredArticles = articles.where(filter.apply).toList();
  for (var article in filteredArticles) {
    print(article);
  }
}

void main() {
  final articles = '''
    1,хлеб,Бородинский,500,5
    2,хлеб,Белый,200,15
    3,молоко,Полосатый кот,50,53
    4,молоко,Коровка,50,53
    5,вода,Апельсин,25,100
    6,вода,Бородинский,500,5
  ''';

  final articleList = parseArticles(articles);

  // Применяем фильтры и выводим результат в консоль
  applyFilter(articleList, CategoryFilter('хлеб'));
  applyFilter(articleList, PriceFilter(500));
  applyFilter(articleList, QuantityFilter(10));
}

List<Article> parseArticles(String articlesString) {
  final List<Article> result = [];
  final lines = articlesString.trim().split('\n');
  for (var line in lines) {
    final parts = line.trim().split(',');
    if (parts.length == 5) {
      final id = int.parse(parts[0]);
      final category = parts[1];
      final name = parts[2];
      final price = int.parse(parts[3]);
      final quantity = int.parse(parts[4]);
      final article = Article(id, category, name, price, quantity);
      result.add(article);
    }
  }
  return result;
}