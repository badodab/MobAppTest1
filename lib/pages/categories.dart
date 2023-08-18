import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.categories});
  final List<dynamic> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				title: const Text("Categories"),
			),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var item = categories[index];
          return _buildList(item);
        },
      ),
    );
  }

  Widget _buildList(item, {hasLeading = false}) {
    const textStyle1 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    // var item = categories[index];
    if (item['subitems'] == null || item['subitems'].isEmpty) {
      return Builder(builder: (context) {
        return InkWell(
					onTap: () {},
					child: ListTile(
							leading: hasLeading ? const SizedBox() : null,
							title: Text(
								item['name'],
								style: hasLeading ? null : textStyle1,
							)),
				);
      });
    }

    // List<Widget> result = item['subitems'].map(_buildList).toList();
    List<Widget> result = [];

    for (var i in item['subitems']) {
      result.add(_buildList(i, hasLeading: true));
    }

    return ExpansionTile(
      title: Text(
        item['name'],
        style: textStyle1,
      ),
      children: result,
    );
  }
}
