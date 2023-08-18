import 'package:jaehub/models/product_tag.dart';
import 'package:jaehub/services/search_fetch.dart';

class Product {
  int id;
  String name;
  String subtitle;
  String description;
  double? price;
  String? oldPrice;
  double ratings;
  List<String> thumbnails = [];
  List<String> covers = [];
  String seoName;
  List<ProductTag>? tags;

  // for app sake variables
  bool isFavorite = false;

  Product({required this.id, required this.name, required this.subtitle, required this.description, required this.price, required this.oldPrice, required this.ratings, required this.thumbnails, required this.covers, this.seoName = '', this.tags});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Id'],
      name: json['Name'],
      description: json['FullDescription'] ?? json['ShortDescription'] ?? '',
      thumbnails: (json['PictureModels'] as List).map((e) => e['ImageUrl'] as String).toList(),
      covers: (json['PictureModels'] as List).map((e) => e['FullSizeImageUrl'] as String).toList(), //[json['PictureModels']?[0]?['FullSizeImageUrl']],
      price: json['ProductPrice']['PriceValue'],
      oldPrice: json['ProductPrice']['OldPrice'],
      ratings: json['ReviewOverviewModel'] == null || json['ReviewOverviewModel']['TotalReviews'] == 0 ? 0 : (json['ReviewOverviewModel']['RatingSum'] / (json['ReviewOverviewModel']['TotalReviews'] * 5)),
      subtitle: json['Sku'] ?? '',
      seoName: json['SeName'] ?? '',
    );
  }

  Future<Product> update() async {
    return await SearchFetch().getProduct(seoName);
  }
}
