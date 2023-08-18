import 'package:flutter/material.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/models/product.dart';
import 'package:jaehub/pages/product_view.dart';
import 'package:jaehub/services/search_fetch.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.item});
  final Product item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductView(product: item)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: AspectRatio(
                aspectRatio: 1,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: (item.thumbnails.isNotEmpty) ? item.thumbnails[0] : ((item.covers.isNotEmpty) ? item.covers[0] : 'https://jersacgymequipment.ph/images/thumbs/0000194_3lbs-vinyl-dumbbell-pair-sale_415.jpeg'),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.photo_outlined);
                  },
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      child: Text(item.name),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.price == null ? 'Unknown' : '₱${commaFormat.format(item.price)}', style: TextStyle(color: Theme.of(context).primaryColor)),
                        ),
                        if (item.oldPrice != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(item.oldPrice!, style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
