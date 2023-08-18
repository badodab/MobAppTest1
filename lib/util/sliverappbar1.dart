import 'package:flutter/material.dart';
import 'package:jaehub/pages/categories.dart';
import 'package:jaehub/services/data.dart';

class SliverAppBar1 extends StatelessWidget {
  const SliverAppBar1({super.key, this.actionIcon});
  final List<IconButton>? actionIcon;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      backgroundColor: Theme.of(context).primaryColor,
      title: TextField(
        onTap: () {
          Navigator.pushNamed(context, '/search');
        },
				readOnly: true,
        decoration:  InputDecoration(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          isCollapsed: true,
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 0, style: BorderStyle.none)),
          hintText: "Search everything",
        ),
        style: const TextStyle(fontSize: 14),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(categories: getCategories()),
                ));
          },
          icon: const Icon(Icons.filter_alt_rounded),
        ),
        ...?actionIcon
      ],
    );
  }
}
