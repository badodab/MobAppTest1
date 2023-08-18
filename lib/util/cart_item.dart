import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/models/cart_product.dart';
import 'package:jaehub/pages/product_view.dart';
import 'package:transparent_image/transparent_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartProduct});
  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Build Cart Item');
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductView(product: cartProduct.product)));
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
                  image: cartProduct.product.covers[0], //'https://jersacgymequipment.ph/images/thumbs/0000194_3lbs-vinyl-dumbbell-pair-sale_415.jpeg',
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.photo_outlined);
                  },
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      child: Text(cartProduct.product.name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(cartProduct.product.price == null ? 'Unknown' : '₱${commaFormat.format(cartProduct.product.price)}', style: TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    Row(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size.zero, // Set this
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // and this
                          ),
                          onPressed: () {
                            --cartProduct.productCount.value;
                            notif.cartProductNotifier.updateEstimation();
                            // notif.checkOutPrice.value -= cartProduct.productCount.value * (cartProduct.product.price ?? 0);
                            if (cartProduct.productCount.value == 0) notif.cartProductNotifier.remove(cartProduct);
                          },
                          child: const Text('-'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ValueListenableBuilder(
                            valueListenable: cartProduct.productCount,
                            builder: (context, value, child) {
                              return Text(value.toString());
                            },
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size.zero, // Set this
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // and this
                          ),
                          onPressed: () {
                            ++cartProduct.productCount.value;
                            notif.cartProductNotifier.updateEstimation();
                            // notif.checkOutPrice.value += cartProduct.productCount.value * (cartProduct.product.price ?? 0);
                          },
                          child: const Text('+'),
                        ),
                      ],
                    )
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
