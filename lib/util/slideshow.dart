import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SlideShow extends StatelessWidget {
  const SlideShow(
      {super.key,
      required this.covers,
      required this.pageController,
      this.isLooping = true,
      this.boxFit = BoxFit.cover});
  final List<dynamic> covers;
  final PageController pageController;
  final bool isLooping;
  final BoxFit boxFit;

  // decoration: BoxDecoration(
  //   gradient: LinearGradient(
  //     colors: [Theme.of(context).primaryColor, Colors.transparent],
  //     begin: Alignment.topCenter,
  //     end: Alignment.center,
  //   ),
  // ),

  // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/abstract.png'),fit: BoxFit.fitWidth, alignment: Alignment.topCenter)),

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: isLooping ? null : covers.length,
        itemBuilder: (context, index) {
          var cover = covers[index % covers.length];
          return Container(
            margin: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: (cover == null || cover == '')
                  ? Container()
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.photo_outlined);
                          },
                          fit: boxFit,
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
