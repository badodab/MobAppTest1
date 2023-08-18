import 'package:flutter/material.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/pages/product_view.dart';
import 'package:jaehub/services/data.dart';
// import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class ShopGrid extends StatelessWidget {
  const ShopGrid({super.key, required this.shopItems});
  final List<dynamic> shopItems;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index >= shopItems.length) {
            return const DecoratedBox(
                decoration: BoxDecoration(color: Colors.black12));
          }
          var item = shopItems[index];
          return ShopGridItem(
            item: item,
            index: index,
            length: shopItems.length,
          );
        },
        childCount: shopItems.length + (shopItems.length % 2),
      ),
    );
  }
}

class ShopGridItem extends StatelessWidget {
  const ShopGridItem(
      {super.key, this.item, required this.index, required this.length});
  final dynamic item;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: EdgeInsets.only(
        top: (index == 0 || index == 1) ? 8 : 4,
        bottom: 4 +
            ((index == (length - 1) ||
                    (index == (length - 2) && (index % 2) == 0))
                ? 4
                : 0),
        left: (((index + 1) % 2) + 1) * 4,
        right: (((index) % 2) + 1) * 4,
      ),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, '/product');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductView(product: productTestItem())));
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: item['image'],
                      imageErrorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.photo_outlined);
                      },
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomRight,
                      child: Text(
                          item['price'] == null
                              ? 'Unknown'
                              : '₱${commaFormat.format(item['price'])}',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    item['name'],
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 12, height: 1.2),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
