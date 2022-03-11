import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  // final String currentGroupId;
  // final String currentListId;

  const ProductsView({Key? key}) : super(key: key);

  final double elevation = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(elevation: elevation, child: Icon(Icons.add), onPressed: () => null),
      appBar: AppBar(
        elevation: elevation,
        title: Text('Products'),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () => null)],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: elevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              title: Text('Title $index'),
              subtitle: Text('Subtitle'),
              onTap: () => null,
            ),
          );
        },
      ),
    );
  }
}
