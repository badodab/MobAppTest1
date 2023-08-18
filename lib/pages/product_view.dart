import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/models/product.dart';
import 'package:jaehub/util/slideshow.dart';
import 'package:jaehub/util/sliverappbar1.dart';
import 'package:jaehub/widgets/header_update.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:transparent_image/transparent_image.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final Product product;
  // final List<dynamic> covers = product.covers; //['https://jersacgymequipment.ph/images/thumbs/0000725_livepro-porta-bar-parallel-bar_550.png', 'https://jersacgymequipment.ph/images/thumbs/0000726_livepro-porta-bar-parallel-bar.png', 'https://jersacgymequipment.ph/images/thumbs/0000728_livepro-porta-bar-parallel-bar.png'];
  // final ValueNotifier<PageController> pageController = ValueNotifier<PageController>(PageController(initialPage: 0));

  bottomTap(int value, BuildContext context) {
    if (value == 0) {
      // isFavorite = !isFavorite;
      product.isFavorite = !product.isFavorite;
    } else if (value == 1) {
      // add to cart
      notif.cartProductNotifier.addOrIncrement(product);
      notif.cartProductNotifier.updateEstimation();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
    } else if (value == 2) {
      Navigator.pushNamed(context, '/payment_how');
    }
  }

  @override
  Widget build(BuildContext context) {
    // NumberFormat commaFormat = NumberFormat.decimalPattern('en_us');
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) => bottomTap(value, context),
        items: [
          BottomNavigationBarItem(icon: Icon((product.isFavorite) ? Icons.favorite : Icons.favorite_outline), label: "Favorites"),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Add to Cart",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.payment), label: "How to Pay"),
        ],
      ),
      body: FutureBuilder(
          future: product.update(), // Future.value({}),
          builder: (context, snapshot) {
            Product dynamicProduct = product;

            // if (snapshot.hasError) {
            //   print('######### ERROR OCCURED');
            //   print(snapshot.error);
            //   print(snapshot.stackTrace);
            // }

            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              dynamicProduct = snapshot.data as Product;
              print('dynamicProduct updated');
              print(dynamicProduct);
            }

            return RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: () async {},
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar1(
                    actionIcon: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        icon: const Icon(Icons.shopping_bag),
                      )
                    ],
                  ),
                  topSlideShow(dynamicProduct),
                  SliverToBoxAdapter(
                    child: slideShowChooser(dynamicProduct),
                  ),
                  HeaderUpdate(dynamicProduct.name),
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          itemSize: 20,
                          initialRating: dynamicProduct.ratings,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(dynamicProduct.price == null ? 'Unknown' : '₱${commaFormat.format(dynamicProduct.price)}', style: TextStyle(color: Theme.of(context).primaryColor)),
                            ),
                            if (dynamicProduct.oldPrice != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(dynamicProduct.oldPrice!, style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      color: Theme.of(context).highlightColor,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(padding: const EdgeInsets.all(16.0), child: descriptionDynamic((dynamicProduct.description.trim() != '') ? dynamicProduct.description.trim() : dynamicProduct.subtitle.trim())),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      color: Theme.of(context).highlightColor,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        'PRODUCT TAGS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: dynamicProduct.tags?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            child: ActionChip(
                              onPressed: () {},
                              //   label: Text('Kettlebell ${index + 1}'),
                              label: Text('${dynamicProduct.tags![index].name} - ${dynamicProduct.tags![index].quantity}'),
                              pressElevation: 1,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget topSlideShow(Product dynamicProduct) {
    return SliverToBoxAdapter(
      child: ValueListenableBuilder(
        valueListenable: notif.productViewPageControllerNotifier,
        builder: (context, value, child) {
          return SlideShow(
            pageController: value,
            covers: dynamicProduct.covers,
            isLooping: false,
            boxFit: BoxFit.fitHeight,
          );
        },
      ),
    );
  }

  Widget slideShowChooser(Product dynamicProduct) {
    return Container(
      color: Colors.black12,
      width: double.infinity,
      height: 85,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: dynamicProduct.covers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              notif.productViewPageControllerNotifier.value.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    dynamicProduct.covers[index % dynamicProduct.covers.length],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget descriptionDynamic(String desc) {
    List<String> imageLinks = [];
    String text = '';

    dom.Document document = htmlParser.parse(desc);

    // Extract image links
    List<dom.Element> imageElements = document.getElementsByTagName('img');
    for (var element in imageElements) {
      String imageUrl = element.attributes['src'] ?? '';
      if (imageUrl != '' && imageUrl.isNotEmpty) {
        imageLinks.add(imageUrl);
      }
    }

    // Extract text

    List<dom.Element> allLI = document.querySelectorAll('li');

    for (var li in allLI) {
      String liText = li.text;
      if (liText.isNotEmpty) {
        li.innerHtml = '• ${li.innerHtml}';
      }
    }

    // List<dom.Element> textElements = document.querySelector('*:not(img)');
    dom.Element? textElements = document.querySelector('*:not(img)');
    text = (textElements?.text.trim() ?? '');
    text = text.replaceAll('•', '\n•');
    text = text.replaceAll(RegExp('\n{2,}'), '\n');
    text = ' $text';

    // for (var element in textElements) {
    //   String elementText = element.text.trim();
    //   if (elementText.isNotEmpty) {
    //     if (element.localName == 'li') {
    //       elementText = '• $elementText';
    //       text += '$elementText\n';
    //       print(element.localName);
    //     }
    //   }
    // }

    return Column(
      children: [
        Text(text, style: const TextStyle(height: 2)),
        ...imageLinks.map(
          (e) => FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: e,
          ),
        ),
      ],
    );
    // Html(
    // 	data: product.description.trim(),
    // ), //Text(product.description.trim(), style: const TextStyle(height: 2)),
  }
}
