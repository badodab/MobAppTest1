import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jaehub/services/data.dart';
import 'package:jaehub/util/bottom_nav.dart';
import 'package:jaehub/util/shopgrid.dart';
import 'package:jaehub/util/slideshow.dart';
import 'package:jaehub/util/sliverappbar1.dart';
import 'package:jaehub/widgets/header_update.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<dynamic> covers;
  final PageController _pageController = PageController(initialPage: 999);

  @override
  void initState() {
    // TODO: implement initState
    // initialCoverData();
    super.initState();
    Timer.periodic(
      const Duration(seconds: 8),
      (timer) {
        if (_pageController != null)
				_pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomNav1(),
      body: FutureBuilder(
          future: getSlideShow(),
          builder: (context, snapshot) {
            // initialCoverData();
            return RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: () async {
                await getSlideShow();
                setState(() {});
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverAppBar1(),
                  topSlideShow(),
                  const HeaderUpdate('Recommendations'),
                  ShopGrid(shopItems: getShopGridInitial()),
                ],
              ),
            );
          }),
    );
  }

  Widget topSlideShow() {
    var dataCovers = getSlideShowInitial();
    return SliverToBoxAdapter(
      child: SlideShow(
        pageController: _pageController,
        covers: dataCovers,
      ),
    );
  }

  // Widget headerUpdate(String title) {
  //   return  SliverToBoxAdapter(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Text(
  //         title,
  //         style: const TextStyle(fontSize: 18),
  //       ),
  //     ),
  //   );
  // }
}
