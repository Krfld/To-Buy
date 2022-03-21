import 'package:flutter/material.dart';
import '../utils/logger.dart';

import '../services/products_service.dart';
import '../classes/product.dart';

class ProductsView extends StatelessWidget {
  // final String currentGroupId;
  // final String currentListId;

  const ProductsView({Key? key}) : super(key: key);

  final double elevation = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // elevation: elevation,
        child: Icon(Icons.add),
        // icon: Icon(Icons.add),
        // label: Text('Add'),
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AddProduct(),
        ),
      ),
      appBar: AppBar(
        elevation: elevation,
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => null,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => await Future.delayed(Duration(seconds: 1)),
        child: ListView.separated(
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
          itemCount: ProductsService.productsToBuy().length + ProductsService.productsBought().length,
          separatorBuilder: (context, index) => index == ProductsService.productsToBuy().length - 1
              ? Divider(height: 32, indent: 64, endIndent: 64, thickness: 1, color: Theme.of(context).primaryColor)
              : SizedBox(height: 8),
          itemBuilder: (context, index) {
            bool bought = index >= ProductsService.productsToBuy().length;
            ProductToken productToken = !bought
                ? ProductsService.productsToBuy().keys.elementAt(index)
                : ProductsService.productsBought().keys.elementAt(index - ProductsService.productsToBuy().length);
            Product product = ProductsService.getProduct(productToken);
            // TODO Check if no products in list
            return Card(
              elevation: elevation,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: bought
                    ? CircleAvatar(
                        child: Icon(Icons.check, color: Theme.of(context).primaryColor),
                        backgroundColor: Colors.transparent,
                      )
                    : null,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                title: Text(product.name),
                subtitle: product.description != null ? Text(product.description ?? '') : null,
                onTap: () => showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => ProductPopup(productToken),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text('Add Product'),
      content: Form(
        key: form,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                enabled: true, // readOnly: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value?.isEmpty ?? true ? 'Name can\'t be empty' : null,
                onSaved: (value) {
                  // Update local name
                  Log.print(value);
                },
              ),
              TextFormField(
                scrollPhysics: BouncingScrollPhysics(),
                enabled: true, // readOnly: true,
                minLines: 1,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Details'),
                // validator: (value) => value?.isEmpty ?? true ? 'Name can\'t be empty' : null,
                onSaved: (value) {
                  // Update local details
                  Log.print(value);
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context), //? Confirm to discard changes
        ),
        ElevatedButton(
          child: Text('Add'),
          onPressed: () {
            if (form.currentState!.validate()) form.currentState!.save();
          },
        ),
      ],
    );
  }
}

class ProductPopup extends StatelessWidget {
  final ProductToken token;

  const ProductPopup(this.token, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    Product product = ProductsService.getProduct(token);

    return AlertDialog(title: Text(product.name));
  }
}
