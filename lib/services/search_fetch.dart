import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jaehub/functions/gsb.dart';
import 'package:jaehub/models/product.dart';
import 'package:jaehub/models/product_tag.dart';

class SearchFetch {
  Future<List<Product>> search(item) async {
    item = Uri.encodeFull(item.toString().trim());
    print('https://jersacgymequipment.ph/instantSearchFor?q=$item');
    // HttpClient httpClient = HttpClient();

    // httpClient.badCertificateCallback = (cert, host, port) => true;
    // HttpClientRequest request = await httpClient.getUrl(
    //     Uri.parse('https://jersacgymequipment.ph/instantSearchFor?q=$item'));

    // HttpClientResponse response = await request.close();

    // String reply = await response.transform(utf8.decoder).join();

    final response = await http.get(Uri.parse('https://jersacgymequipment.ph/instantSearchFor?q=$item'));

    final data = (jsonDecode(response.body)['Products'] as List).map((e) => Product.fromJson(e)).toList();
    return data;
  }

  Future<Product> getProduct(permalink) async {
    var response = await http.get(Uri.parse('https://jersacgymequipment.ph/$permalink'));
    var data = response.body.toString();
    var title = gsb(data, '<meta itemprop="name" content="', '"').trim();
    var sku = gsb(data, '<meta itemprop="sku" content="', '"');
    var description = gsb(data, '<meta itemprop="description" content="', '"');
    var image = gsb(data, '<meta itemprop="image" content="', '"');
    var price = gsb(data, '<meta itemprop="price" content="', '"');
    var currency = gsb(data, '<meta itemprop="currency" content="', '"');
    var id = gsb(data, 'data-productid="', '"');
    var fullDescription = gsb(data, '<div class="full-description">', '</div>');
    var shortDescription = gsb(data, '<div class="short-description">', '</div>');
    var productTagsRaw = gsb(data, '<div class="product-tags-list">', '</div>');
    List<String> images = getProductImages(data);
    var productTags = getProductTagsFromRaw(productTagsRaw);
    String? oldPrice = gsb(data, '<label>Old price:</label>', '</span>').replaceAll(RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true), '').trim();
    if (oldPrice == '') oldPrice = null;

    print('----');
    print('title: $title');
    print('sku: $sku');
    print('description: $description');
    print('image: $image');
    print('price: $price');
    print('oldPrice: $oldPrice');
    print('currency: $currency');
    print('id: $id');
    print('fullDescription: $fullDescription');
    print('shortDescription: $shortDescription');
    print(productTags);
    print(images);
    print('----');

    return Product(
      covers: images,
      description: fullDescription,
      id: int.parse(id),
      name: title,
      oldPrice: oldPrice,
      thumbnails: [],
      subtitle: shortDescription,
      ratings: 0,
      price: double.parse(price),
      tags: productTags,
      seoName: permalink,
    );
  }

  List<String> getProductImages(raw) {
    var data = raw.toString();
    List<String> result = [];
    var look = 'data-full-image-url="';
    while (data.contains(look)) {
      var imgOnly = gsb(data, look, '"');
      var img = '${look + imgOnly}"';
      if (!result.contains(imgOnly)) result.add(imgOnly);
      data = data.replaceAll(img, '');
    }
    return result;
  }

  List<ProductTag> getProductTagsFromRaw(raw) {
    var data = raw.toString();
    List<ProductTag> result = [];
    while (data.contains('<li class="tag">')) {
      var item = '<li class="tag">${gsb(data, '<li class="tag">', '</span>')}</span>';
      var href = gsb(item, 'href="', '"');
      var tag = gsb(item, 'class="producttag">', '<');
      var quantity = int.parse(gsb(item, '<span>', '</span>').replaceAll('(', '').replaceAll(')', '').trim());
      //   result.add({
      //     'tag': tag,
      //     'href': href,
      //     'quantity': quantity
      //   });
      result.add(ProductTag(tag, quantity, href));
      data = data.replaceAll(item, '');
    }
    return result;
  }
}
