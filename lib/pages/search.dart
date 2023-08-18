import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jaehub/models/product.dart';
import 'package:jaehub/services/search_fetch.dart';
import 'package:jaehub/util/suggest_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> searchItems = [];
  Timer? _debounceTimer;

  void changeText(value) {
    if (_debounceTimer != null && _debounceTimer!.isActive) {
      _debounceTimer!.cancel();
    }

    // Create a new debounce timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      searchItems = await SearchFetch().search(value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: changeText,
          autofocus: true,
          decoration: InputDecoration(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            isCollapsed: true,
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            hintText: "Search everything",
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: Container(
				child: ListView.builder(
					physics: const BouncingScrollPhysics(),
					itemCount: searchItems.length,
					itemBuilder: (context, index) {
						EdgeInsets spacing = EdgeInsets.zero;
						if (index == 0) {
							spacing = const EdgeInsets.symmetric(vertical: 8);
						} else {
							spacing = const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 8);
						}
			
						var item = searchItems[index];
			
						return Container(
							padding: spacing,
							child: SearchItem(item: item),
						);
					},
				),
			),
    );
  }
}
