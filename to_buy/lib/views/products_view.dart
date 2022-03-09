import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  // final String currentGroupId;
  // final String currentListId;

  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
